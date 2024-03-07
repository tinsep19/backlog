name: show
flags:
  - long: --user-id
    short: -u
    arg: USER_ID
    required: true
  - long: --profile
    arg: PROFILE
    default: default
---

ini_load "$BACKLOG_CLI_CONFIG"

local profile="${args[--profile]}"
local base_url="${ini[$profile.url]}"
local api_key="${ini[$profile.key]}"
local user_id="${args[--user-id]}"

curl -s -G --data-urlencode "apiKey=${api_key}" "$base_url/api/v2/users/$user_id"
