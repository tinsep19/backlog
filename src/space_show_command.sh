name: show
flags:
  - long: --profile
    arg: PROFILE
    default: default
---

ini_load "$BACKLOG_CLI_CONFIG"

local profile="${args[--profile]}"
local base_url="${ini[$profile.url]}"
local api_key="${ini[$profile.key]}"
local queries=()

queries+=(--data-urlencode "apiKey=${api_key}")
curl -s -G "${queries[@]}" "$base_url/api/v2/space"
