{ config, pkgs, ... }:
{
  #programs.rofi = {
   # enable = true;
  #};

    home.file.".config/rofi/config.rasi".text = ''

configuration {
        show-icons: false;
        disable-history:        true;
        lines: 7;
        margin: 0;
        columns: 1;
        font: "SFMono Nerd Font 10";
        bw: 0;
        eh: 1;
        auto-select: false;
        line-margin: 0;
        separator-style: "solid";
        hide-scrollbar: true;
}
* {
    active-foreground: @foreground;
    normal-background: @background;
    normal-foreground: @foreground;
    urgent-foreground: @foreground;

    alternate-active-background: @background;
    alternate-active-foreground: @foreground;
    alternate-normal-background: @background;
    alternate-normal-foreground: @foreground;
    alternate-urgent-background: @background;
    alternate-urgent-foreground: @foreground;

    selected-active-foreground: @foreground;
    selected-normal-foreground: @foreground;
    selected-urgent-foreground: @foreground;

    background-color: @background;
    border-color: @background;
    spacing: 2;
}

@import "/home/vi/.cache/wal/colors-rofi-dark.rasi"

#window {
    location: north west;
    width: 40%;
    x-offset: 600px;
    y-offset: 350px;
    background-color: @background;
    border: 0;
    padding: 5;
}

#mainbox {
    border: 0;
    padding: 5;
}

#message {
    border: 2px 0px 0px;
    border-color: @border-color;
    padding: 1px;
}

#textbox {
    text-color: @foreground;
}

#inputbar {
    children:   [ prompt,textbox-prompt-colon,entry,case-indicator ];
    expand: false;
}

#textbox-prompt-colon {
    expand: false;
    str: ":";
    margin: 0px 0.3em 0em 0em;
    text-color: @normal-foreground;
}

#listview {
    fixed-height: 0;
    border: 2px 0px 0px;
    border-color: @border-color;
    spacing: 2px;
    scrollbar: true;
    padding: 2px 0px 0px;
}

#element {
    border: 0;
    padding: 1px;
}

#element.normal.normal {
    background-color: @normal-background;
    text-color: @normal-foreground;
}

#element.normal.urgent {
    background-color: @urgent-background;
    text-color: @urgent-foreground;
}

#element.normal.active {
    background-color: @active-background;
    text-color: @active-foreground;
}

#element.selected.normal {
    background-color: @selected-normal-background;
    text-color: @selected-normal-foreground;
}

#element.selected.urgent {
    background-color: @selected-urgent-background;
    text-color: @selected-urgent-foreground;
}

#element.selected.active {
    background-color: @selected-active-background;
    text-color: @selected-active-foreground;
}

#element.alternate.normal {
    background-color: @alternate-normal-background;
    text-color: @alternate-normal-foreground;
}

#element.alternate.urgent {
    background-color: @alternate-urgent-background;
    text-color: @alternate-urgent-foreground;
}

#element.alternate.active {
    background-color: @alternate-active-background;
    text-color: @alternate-active-foreground;
}

#scrollbar {
    width: 4px;
    border: 0;
    handle-width: 8px;
    padding: 0;
}

#sidebar {
    border: 2px 0px 0px;
    border-color: @border-color;
}

#button {
    text-color: @normal-foreground;
}

#button.selected {
    background-color: @selected-normal-background;
    text-color: @selected-normal-foreground;
}

#inputbar {
    spacing: 0;
    text-color: @normal-foreground;
    padding: 1px;
}

#case-indicator {
    spacing: 0;
    text-color: @normal-foreground;
}

#entry {
    spacing: 0;
    text-color: @normal-foreground;
}

#prompt {
    spacing: 0;
    text-color: @normal-foreground;
}

'';

}
