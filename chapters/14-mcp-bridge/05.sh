claude mcp add-json "HA" '{
  "type": "http",
  "url": "http://homeassistant.local:8123/api/mcp",
  "oauth": {
    "clientId": "http://localhost:12345",
    "callbackPort": 12345
  }
}'
