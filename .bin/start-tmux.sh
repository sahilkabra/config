#!/bin/bash

s_vim = tmux ls | grep vim | cut -c 1
s_wk = tmux ls | grep wk | cut -c 1
s_personal = tmux ls | grep personal | cut -c 1

if [[ -z ${s_vim} ]]
then
    tmux new-session -d -s vim
fi
if [[ -z ${s_wk} ]]
then
    tmux new-session -d -s wk
    #  -------------
    # |             |
    # |             |
    # |             |
    # |             |
    #  -------------
    tmux send-keys -t wk "xplan-src" enter
    tmux split-window -t wk -v
    #  -------------
    # |             |
    # |             |
    #  -------------
    # |             |
    # |             |
    #  -------------
    tmux split-window -t wk -v
    #  -------------
    # |             |
    # |             |
    #  -------------
    # |             |
    #  -------------
    # |             |
    #  -------------
    tmux send-keys -t wk "xplan-src" enter
    tmux split-window -t wk -h
    #  -------------
    # |             |
    # |             |
    #  -------------
    # |             |
    #  -------------
    # |      |      |
    #  -------------
    tmux select-pane -t wk -U
    tmux select-pane -t wk -U
    tmux split-window -t wk -h
    #  -------------
    # |      |      |
    # |      |      |
    #  -------------
    # |             |
    #  -------------
    # |      |      |
    #  -------------
    tmux send-keys -t wk "htop -u sahilkabra" enter
    tmux select-pane -t wk -L
    tmux split-window -t wk -v
    #  -------------
    # |      |      |
    #  ------|
    # |      |      |
    #  -------------
    # |             |
    #  -------------
    # |      |      |
    #  -------------
    tmux send-keys -t wk "xplan-src" enter
    tmux select-pane -t wk -D
    tmux resize-pane -t wk -U 20
    tmux resize-pane -t wk -D 20
fi
if [[ -z ${s_personal} ]]
then
    tmux new-session -d -s personal
fi

