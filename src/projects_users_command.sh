name: users
flags:
  - long: --profile
    arg: PROFILE
    default: default
  - long: --all
    required: false
    help: List everything, not just the ones you belong to. (Only for administrators)
  - long: --project-id
    required: true
    arg: PROJ_ID_OR_KEY
    help: specify project
---

ini_load "$BACKLOG_CLI_CONFIG"

local profile="${args[--profile]}"
local project_id="${args[--project-id]}"

local base_url="${ini[$profile.url]}"
local api_key="${ini[$profile.key]}"

local queries=()

queries+=(--data-urlencode "apiKey=${api_key}")
if [ -n "${args[--all]}" ]; then
    queries+=(--data-urlencode "all=true")
fi
if [ -n "${args[--only-archived]}" ]; then
    queries+=(--data-urlencode "archived=true")
fi
if [ -n "${args[--only-unarchived]}" ]; then
    queries+=(--data-urlencode "archived=false")
fi

curl -s -G "${queries[@]}" "$base_url/api/v2/projects/$project_id/users"
