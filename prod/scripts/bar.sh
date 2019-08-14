#!/usr/bin/env bash

refresh_rate=1
separator="%{F#404040}|%{F-}"

foreground_start="%{F#01AB84}"
foreground_end="%{F-}"

function local_date() {
    local current_date=$(date '+%a %d %b %Y')
    local symbol=""
    echo -n "${foreground_start}${symbol}${foreground_end} ${current_date}"
}

function local_time() {
    local time_now=$(date '+%l:%M %p' | awk '{$1=$1};1')
    local symbol=""
    echo -n "${foreground_start}${symbol}${foreground_end} ${time_now}"
}

function battery() {
    local percentage=$(cat /sys/class/power_supply/BAT0/capacity)
    local battery_status=$(cat /sys/class/power_supply/BAT0/status)
    #local symbol_array=("" "" "" "" "")
    case "${battery_status}" in
        "Charging")
            local symbol=" "
            # can do for loop and if statement in here to change symbol
            ;;
        "Discharging")
            local symbol=""
            ;;
        "Full")
            local symbol=" "
            ;;
        "Unknown")
            local symbol="..."
            ;;
    esac
    echo -n "${foreground_start}${symbol}${foreground_end} ${percentage}%"
}

function wireless() {
    local interface="wlp2s0"
    local symbol=""
    local ssid=$(iwconfig "${interface}" | grep "${interface}" | awk -F'"' '{print $2}')
    if [[ -z "${ssid}" ]]; then
        echo -n "${foreground_start}${symbol}${foreground_end} %{F#888888}not connected%{F-}"
    else
        echo -n "${foreground_start}${symbol}${foreground_end} ${ssid}"
    fi
}

function loadavg() {
    local symbol=""
    echo -n "${foreground_start}${symbol}${foreground_end} $(cat /proc/loadavg | awk -F' ' '{print $1,$2,$3}')"
}

while true; do
    echo -n " ${separator} "
    loadavg
    echo -n " ${separator} "
    wireless
    echo -n " ${separator} "
    battery
    echo -n " ${separator} "
    local_date
    echo -n " ${separator} "
    local_time
    echo " "
    sleep "${refresh_rate}"
done
