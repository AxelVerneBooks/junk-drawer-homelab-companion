# Junk Drawer Homelab Configurator

## Overview

The Configurator is an interactive UI (hosted at [axelverne.com/jd/build](https://axelverne.com/jd/build)) that helps users recommend which chapters of "Junk Drawer Homelab" to build based on their hardware inventory, goals, and network setup.

## How It Works

1. User selects hardware (Pis, laptops, desktops, phones, storage, router capabilities)
2. User selects goals (block ads, media streaming, photos, passwords, remote access, AI, etc.)
3. User describes their network (can set DHCP reservations? VLANs? ISP allows port forwarding?)
4. Configurator sends `rules.json` to an LLM (Claude, etc.) via a prompt template
5. LLM recommends chapter order, hardware assignments, and warns about conflicts
6. UI displays recommended build path with Tailscale→all other services ordering

## rules.json Structure

### `inputs`

Three category arrays for the UI form:

- **`hardware`**: CPU arch, RAM, GPU capability, always-on potential. IDs like `pi4`, `laptop_intel_8gen`, `desktop_nvidia`.
- **`network`**: Router features (DHCP, VLANs) and ISP capabilities (public IP, port forwarding).
- **`goals`**: Services to build (ads, movies, photos, passwords, audio, remote, backups, cameras, AI, automations, smart home, cluster).

### `chapters` (array of chapters 4–16)

Each chapter describes:
- **`id`, `number`, `slug`**: Unique identifiers and URL fragment.
- **`title`, `what_it_builds`**: One-liner on what the chapter sets up.
- **`min_requirements`**: CPU arch, RAM (GB), GPU needed, always-on?
- **`goals`**: Which goal IDs this chapter satisfies (e.g., `["ads"]` for Pi-hole).
- **`compose_files`**: Paths to Docker compose files in companion repo.
- **`env_variables`**: Environment vars those compose files reference (grep `${VAR}`).
- **`subscriptions_replaces`**: Name of SaaS this chapter obsoletes (no prices).

### `rules` (placement logic)

Each rule maps a hardware type to recommended chapter placement. Structure:

```json
{
  "priority": 95,
  "condition": {"hardware": "pi4"},
  "placement": [
    {"chapter": 4, "box": "pi4", "why": "reason for this assignment"}
  ]
}
```

**Priority**: Higher = preferred (100 best, 10 least). Used to pick tiebreakers.

**Placement**: Array of (chapter, box_name, why). The `why` explains the assignment (e.g., "Pi-hole DNS blocker, low power" or "Ollama with CUDA GPU").

### `build_order` (dependency phases)

Six phases that ensure safe, dependency-respecting build sequence:

1. **Foundation**: Docker + Pi-hole (must be first)
2. **Core**: Media, passwords, podcasts, remote access
3. **Big Tech breakup**: Photos, cameras
4. **Security**: Backups, network isolation
5. **AI & automation**: Ollama → Home Assistant → n8n workflows
6. **Advanced**: Proxmox cluster (last, optional)

### `prompt_template`

A template string with placeholders (`{{selected_hardware}}`, `{{selected_goals}}`, `{{network_capabilities}}`) that the UI fills in and sends to an LLM. The template instructs the LLM to:
- Recommend which chapters 4–16 fit the user's hardware and goals
- Assign each chapter to a box (pi4, laptop, desktop)
- Order the build respecting dependencies
- Warn about gotchas (e.g., "Ollama needs GPU; CPU-only is slow")

## Key Design Decisions

### Hardware Models
- **Pi 2/3/4/5**: Separate IDs for resource planning (Pi 2 struggles; Pi 4 is sweet spot; Pi 5 overkill for most setups).
- **Intel 8th-gen+**: Explicitly noted for Quick Sync transcoding (Ch 5 Jellyfin).
- **GPU tiers**: NVIDIA CUDA >> AMD ROCm > CPU for Ollama (Ch 13).
- **Phones**: Not servers; Chapter 6 source for cameras, dashboards, sensors.

### Chapter Assignments
- **Pi-hole (4)**: Always recommended, works on any ARM/x86, must be always-on.
- **Jellyfin (5)**: Wants x86 or fast ARM + Quick Sync GPU for 4K transcoding.
- **Immich (7)**: 4GB+ RAM for photo ML; GPU helps but not required.
- **Ollama (13)**: **GPU is essential** for practical speed (CUDA > ROCm > CPU).
- **Tailscale (10)**: Lightweight remote access; add to everything.
- **Home Assistant + MCP (14)**: Automation hub; depends on stable always-on box.
- **n8n (15)**: Workflow engine; depends on core services already running.
- **Proxmox (16)**: Last resort; consolidates 3+ old x86 machines into VMs.

### Build Order Philosophy
Foundation (3 + 4) → Core (5, 8, 9, 10) → Big Tech (6, 7) → Security (11, 12) → AI (13, 14, 15) → Cluster (16).

Rationale:
- Docker + Pi-hole first (every lab needs DNS).
- Core stateless services (media, passwords, podcasts) next.
- Backup/network security before advanced features.
- AI after stable foundation (Ollama heavy; MCP depends on stable Home Assistant).
- Cluster only when scaling.

## Usage

1. **UI form submission**: User selects hardware, goals, network. JSON sent to backend.
2. **LLM invocation**: Backend fills `prompt_template` and sends to Claude/GPT.
3. **Recommendation**: LLM returns JSON with:
   - `recommended_chapters`: [4, 8, 5, 9, 10, ...]
   - `hardware_assignments`: {"4": "pi4", "5": "laptop", ...}
   - `build_order`: [4, 8, 5, 9, 10, 7, ...]
   - `warnings`: ["Jellyfin on Pi4 may struggle with 4K", ...]
   - `subscriptions_saved`: "Netflix, Disney+, Google One, ..."
4. **UI display**: Shows chapters in build order, each with hardware assignment, why text, and gotchas.

## Extensibility

To add a new chapter (e.g., Chapter 17):
1. Add to `chapters` array with id, slug, title, min_requirements, goals, compose_files, env_variables.
2. Add rules mapping hardware → this chapter.
3. Update `build_order` if it introduces new dependencies.
4. Update `prompt_template` if reasoning changes.

To add hardware (e.g., Raspberry Pi Pico):
1. Add to `inputs.hardware` with id, label, cpu_arch, ram_gb, has_gpu, always_on_capable.
2. Add rules for services it can run.
3. Note in `prompt_template` if it has special behavior.

## Testing

Load `rules.json` with Python:

```python
import json
with open('configurator/rules.json') as f:
    rules = json.load(f)
assert len(rules['chapters']) == 13
assert len(rules['rules']) > 0
```

Or validate online at [jsonlint.com](https://www.jsonlint.com/).
