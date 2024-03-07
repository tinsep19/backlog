name: myself
flags:
  - long: --profile
    arg: PROFILE
    default: default
---

ini_load "$BACKLOG_CLI_CONFIG"

local profile="${args[--profile]}"
local base_url="${ini[$profile.url]}"
local api_key="${ini[$profile.key]}"

curl -s -G --data-urlencode "apiKey=${api_key}" "$base_url/api/v2/users/myself"
