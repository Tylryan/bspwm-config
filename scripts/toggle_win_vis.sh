#!/usr/bin/bash

# A program that toggles the visibility 
# of a single window for BSPWM

# Current window location in memory
# This should work with Pacman and Dnf

TMP_FILE=/tmp/window-id.txt

xdo_tool=$(ls /usr/bin | grep ^xdo)
[[ $? -eq 1 ]] && notify-send "error: you don't have `xdo` installed."

export WIN_ID=$(xdo id)
HIDE_COMMAND="xdo hide"
SHOW_COMMAND="xdo show"

function set_commands()
{
    # Use of case statement in case other package managers
    # call xdo something different.
    case ${xdo_tool} in
        "xdotool")
            export WIN_ID=$(xdotool getactivewindow)
            HIDE_COMMAND="xdotool windowunmap"
            SHOW_COMMAND="xdotool windowmap"
            ;;
        *)
            notify-send "error: $?"
            exit 1
            ;;
    esac
}

hide_window()
{
    # Put that location in a temp file.
    echo ${WIN_ID} > ${TMP_FILE}
    # hide the window
    ${HIDE_COMMAND} ${WIN_ID}
}

show_window()
{
    # Find the id of the hidden window
    hidden_win_id=$(cat ${TMP_FILE})
    # show the hidden window
    ${SHOW_COMMAND} ${hidden_win_id}
    rm ${TMP_FILE}
}

toggle_window()
{
    if [[ -f $TMP_FILE ]];then
        show_window
    else
        hide_window
    fi
}

set_commands
toggle_window

exit 0
