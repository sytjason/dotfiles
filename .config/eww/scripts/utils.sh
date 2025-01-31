spaces(){
    local hyprctl_workspaces=$(hyprctl workspaces -j)
    local WORKSPACE_WINDOWS=$(jq 'map({key: .id | tostring, value: .windows}) | from_entries' <<< "$hyprctl_workspaces")
    local keys=$(jq '.[] | .id' <<< "$hyprctl_workspaces" | sort)
    jq --argjson windows "${WORKSPACE_WINDOWS}" --slurp -Mc 'map(tostring) | map({id: ., windows: ($windows[.]//0)})' <<< "$keys"
}

special_workspace() {
    hyprctl monitors -j | jq '.[] | select(.focused) | .specialWorkspace.id'
}

active_workspace() {
    hyprctl monitors -j | jq '.[] | select(.focused) | .activeWorkspace.id'
}

windows() {
    hyprctl clients -j | jq -Mc "[.[] | {address: .address, class: .class, title: .title, wid: .workspace.id}]"
}

active_window() {
    local active_window=$(hyprctl activewindow -j)
    # jq -e 'type == "array"' >/dev/null <<<$active_window && jq -Mc "[.[] | {address: .address, class: .class, title: .title, wid: .workspace.id}]" <<<$active_window || jq -Mc ". | [{address: .a ddress, class: .class, title: .title, wid: .workspace.id}]" <<<$active_window
    jq -r ".address" <<< $active_window
}


