# Chapter 10 — Fortress I: Reach It From Anywhere Without Opening a Port (Tailscale)

Chapter 10 of *The Junk Drawer Homelab*. Every code block from the chapter, in order. Copy page: https://axelverne.com/jd/10

| # | file | section | before it in the book |
|---|---|---|---|
| 01 | `01.sh` | The build | SSH into the device (not into a container): |
| 02 | `02.sh` | The build | Then authenticate: |
| 03 | `03.sh` | The build | Confirm: |
| 04 | `04.sh` | The build | Subnet router — the machine in the lab acts as a gateway to the entire home network, so you can reach devices that aren' |
| 05 | `05.sh` | The build | IP forwarding — the kernel needs to route packets between the tailnet and the home network. Make it permanent: |
| 06 | `06.sh` | The build | If one Pi is always on and has a good internet connection, make it an exit node. All traffic from your phone can tunnel  |
| 07 | `07.sh` | The build | On the lab machine: |
| 08 | `08.yml` | The build | Update the DOMAIN in Vaultwarden's compose.yaml: |
| 09 | `09.sh` | The build | Tailscale Funnel — if you want to expose one of these apps to the public internet (a webhook receiver, a demo link), use |
