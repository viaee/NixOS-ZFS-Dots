{ config, lib, pkgs, ... }:

{
  imports = [ 
    ./hypr.nix
  ];


  home.packages = with pkgs; [ 
    swww
    pywal
    hyprland
   (waybar.overrideAttrs (oldAttrs: { mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true "]; }))   
    
  ];

  
  #test later systemd.user.targets.hyprland-session.Unit.Wants = [ "xdg-desktop-autostart.target" ];
  wayland.windowManager.hyprland = {
    enable = true;
    systemdIntegration = true;
    extraConfig = ''

    # Monitor
    monitor=DP-1,1920x1080@144,1920x0,1

    # Autostart

    exec-once = dunst
    exec-once = swww init


    # Input config
    input {
        kb_layout = us
        kb_variant =
        kb_model =
        kb_options =
        kb_rules =

        follow_mouse = 1
	force_no_accel=1

        sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
    }

    general {

        gaps_in = 5
        gaps_out = 5
        border_size = 0
        # col.active_border = rgba(33ccffee) rgba(00ff99ee) 45deg
        # col.inactive_border = rgba(595959aa)

        layout = dwindle
    }

    decoration {

        rounding = 2
	fullscreen_opacity=1
        active_opacity = 0.95
	inactive_opacity = 0.80
        drop_shadow = true
        shadow_range = 40
        shadow_render_power = 5
	shadow_ignore_window = 1
        col.shadow = rgba(1a1a1aee)
    }

    animations {
        enabled = yes

        bezier = myBezier, 0.05, 0.9, 0.1, 1.05

        animation = windows, 1, 3.5, myBezier
        animation = windowsOut, 1, 5, default, popin 80%
        animation = border, 1, 5, default
        animation = fade, 1, 5, default
        animation = workspaces, 1, 5, default
    }

    dwindle {
        pseudotile = yes
    }

    master {
        new_is_master = yes
    }

    gestures {
        workspace_swipe = false
    }

    # Example windowrule v1
    # windowrule = float, ^(kitty)$
    # Example windowrule v2
    # windowrulev2 = float,class:^(kitty)$,title:^(kitty)$

    $mainMod = ALT
    bind = $mainMod, G, fullscreen,
    bind = $mainMod SHIFT, W, exec, /home/vi/base/home/nixos/programs/scripts/updatewal-swww.sh
    bind = $mainMod CTRL, W, exec, /home/vi/base/home/nixos/programs/scripts/wallpaper-swww.sh
    bind = $mainMod CTRL, P, exec, grim

    #bind = $mainMod, RETURN, exec, cool-retro-term-zsh
    bind = $mainMod, RETURN, exec, kitty
    bind = $mainMod, A, exec, firefox
    bind = $mainMod, B, exec, waybar
    bind = $mainMod SHIFT, B, exec, pkill waybar
    bind = $mainMod SHIFT, C, killactive,
    bind = $mainMod, M, exit,
    bind = $mainMod, F, exec, pcmanfm
    bind = $mainMod, V, togglefloating,
    bind = $mainMod SHIFT, space, workspaceopt, allfloat
    bind = $mainMod, D, exec, rofi -show drun
    bind = $mainMod, P, pseudo, # dwindle
    bind = $mainMod, J, togglesplit, # dwindle

    # Functional keybinds
    binde=, XF86AudioRaiseVolume, exec, wpctl set-volume -l 1.5 @DEFAULT_AUDIO_SINK@ 5%+
    bindl=, XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
    bind=,XF86AudioMute,exec,amixer -D pulse set Master +1 toggle

    # to switch between windows in a floating workspace
    bind = SUPER,Tab,cyclenext,
    bind = SUPER,Tab,bringactivetotop,

    # Move focus with mainMod + arrow keys
    bind = $mainMod, left, movefocus, l
    bind = $mainMod, right, movefocus, r
    bind = $mainMod, up, movefocus, u
    bind = $mainMod, down, movefocus, d

   # VIM like focus
    bind = ALT, H, movefocus, l
    bind = ALT, L, movefocus, r
    bind = ALT, K, movefocus, u
    bind = ALT, J, movefocus, d

    bind = CTRL, L, resizeactive, 20 0
    bind = CTRL, H, resizeactive, -20 0
    bind = CTRL, K, resizeactive, 0 -20
    bind = CTRL, J, resizeactive, 0 20

    # Switch workspaces with mainMod + [0-9]
    bind = $mainMod, 1, workspace, 1
    bind = $mainMod, 2, workspace, 2
    bind = $mainMod, 3, workspace, 3
    bind = $mainMod, 4, workspace, 4
    bind = $mainMod, 5, workspace, 5
    bind = $mainMod, 6, workspace, 6
    bind = $mainMod, 7, workspace, 7
    bind = $mainMod, 8, workspace, 8
    bind = $mainMod, 9, workspace, 9
    bind = $mainMod, 0, workspace, 10

    # Move active window to a workspace with mainMod + SHIFT + [0-9]
    bind = $mainMod SHIFT, 1, movetoworkspace, 1
    bind = $mainMod SHIFT, 2, movetoworkspace, 2
    bind = $mainMod SHIFT, 3, movetoworkspace, 3
    bind = $mainMod SHIFT, 4, movetoworkspace, 4
    bind = $mainMod SHIFT, 5, movetoworkspace, 5
    bind = $mainMod SHIFT, 6, movetoworkspace, 6
    bind = $mainMod SHIFT, 7, movetoworkspace, 7
    bind = $mainMod SHIFT, 8, movetoworkspace, 8
    bind = $mainMod SHIFT, 9, movetoworkspace, 9
    bind = $mainMod SHIFT, 0, movetoworkspace, 10

    # Scroll through existing workspaces with mainMod + scroll
    bind = $mainMod, mouse_down, workspace, e+1
    bind = $mainMod, mouse_up, workspace, e-1

    # Move/resize windows with mainMod + LMB/RMB and dragging
    bindm = $mainMod, mouse:272, movewindow
    bindm = $mainMod, mouse:273, resizewindow

        '';
  };
}
