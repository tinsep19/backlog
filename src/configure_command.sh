if [ ! -f "$BACKLOG_CLI_CONFIG" ]; then
    mkdir -p "$(dirname "$BACKLOG_CLI_CONFIG")"
    touch "$BACKLOG_CLI_CONFIG"
    chmod 600 "$BACKLOG_CLI_CONFIG"
    echo "$(green create) $BACKLOG_CLI_CONFIG"
fi

local profile
local url
local key

echo "$(cyan Create Your profile.)"
read -p "$(cyan_underlined PROFILE) : " profile
read -p "$(cyan_underlined Backlog Space URL) : " url
read -p "$(cyan_underlined YOUR API KEY) : " key

ini_load "$BACKLOG_CLI_CONFIG"

ini[$profile.url]="$url"
ini[$profile.key]="$key"

ini_save "$BACKLOG_CLI_CONFIG"
