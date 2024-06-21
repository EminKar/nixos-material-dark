{ pkgs, config, ... }: {
  imports = [ ./rules.nix ./binds.nix ./autostart.nix ];
  home.packages = with pkgs; [ 
    wl-screenrec
    hyprcursor
  ];

  wayland.windowManager.hyprland = {
    enable = true;
    xwayland.enable = true;
    # package = inputs.hyprland.packages.${pkgs.system}.hyprland;
    extraConfig = ''
      monitor=HDMI-A-1,2560x1080@100,0x0,1

      exec = sh $HOME/.config/hypr/autostart.sh
      source = ./binds.conf
      source = ./rules.conf

      workspace = 1, monitor:HDMI-A-1, default:true
      workspace = 2, monitor:HDMI-A-1, default:true
      workspace = 3, monitor:HDMI-A-1, default:true
      workspace = 4, monitor:HDMI-A-1, default:true
      workspace = 5, monitor:HDMI-A-1, default:true
      workspace = 6, monitor:HDMI-A-1, default:true
      workspace = 7, monitor:HDMI-A-1, default:true
      workspace = 8, monitor:HDMI-A-1, default:true
      workspace = 9, monitor:HDMI-A-1, default:true

      input {
        kb_layout = us,ru
        kb_options = grp:caps_toggle
        follow_mouse = 1
        sensitivity = 0.6
        repeat_rate = 50
        repeat_delay = 500
        }
      

      

      device {
        name = epic-mouse-v1
        sensitivity = -1
      }

      general {
        gaps_in = 3
        gaps_out = 8
        border_size = 2
        col.inactive_border = rgb(424242)
        col.active_border = rgb(616161) 
        layout = master
      }

      misc { 
        vfr = true
        enable_swallow = true
        disable_splash_rendering = true
        disable_autoreload = true
        disable_hyprland_logo = true
        animate_manual_resizes = true
        animate_mouse_windowdragging = true
      }

      dwindle {
        force_split = 2
        preserve_split = true
        default_split_ratio = 0.6
        use_active_for_splits = false
      }

      master {
        always_center_master = true
        mfact = 0.65
      }

      # group {
      #   col.border_active = rgb(3C3836) = true
      #   col.border_inactive = rgb(504945)
      #   groupbar {
      #     render_titles = false
      #     gradients = true
      #     col.active = rgb(3C3836)
      #     col.inactive = rgb(504945)
      #   }
      # }

      binds {
        workspace_back_and_forth = true
        allow_workspace_cycles = true
      }

      decoration {
        rounding = 7
        drop_shadow = true
        shadow_range = 5
        shadow_render_power = 1
        col.shadow = rgb(1C1D1D)
        blur {
          enabled = false
          new_optimizations = true
        }
      }

        animations {
        enabled = true

        bezier = linear, 0, 0, 1, 1
        bezier = md3_standard, 0.2, 0, 0, 1
        bezier = md3_decel, 0.05, 0.7, 0.1, 1
        bezier = md3_accel, 0.3, 0, 0.8, 0.15
        bezier = overshot, 0.05, 0.9, 0.1, 1.1
        bezier = crazyshot, 0.1, 1.5, 0.76, 0.92
        bezier = hyprnostretch, 0.05, 0.9, 0.1, 1.0
        bezier = menu_decel, 0.1, 1, 0, 1
        bezier = menu_accel, 0.38, 0.04, 1, 0.07
        bezier = easeInOutCirc, 0.85, 0, 0.15, 1
        bezier = easeOutCirc, 0, 0.55, 0.45, 1
        bezier = easeOutExpo, 0.16, 1, 0.3, 1
        bezier = softAcDecel, 0.26, 0.26, 0.15, 1
        bezier = md2, 0.4, 0, 0.2, 1
      
        animation = windows, 1, 4, md3_decel, popin 60%
        animation = windowsIn, 1, 4, md3_decel, popin 60%
        animation = windowsOut, 1, 4, md3_accel, popin 60%
        animation = border, 1, 10, default
        animation = fade, 1, 4, md3_decel
        animation = layersIn, 1, 4, menu_decel, slide
        animation = layersOut, 1, 4, menu_accel
        animation = fadeLayersIn, 1, 4, menu_decel
        animation = fadeLayersOut, 1, 4, menu_accel
        animation = workspaces, 1, 4, menu_decel, slide
        animation = specialWorkspace, 1, 4, md3_decel, slidevert
       
        

       
        }

    '';
  };
}
