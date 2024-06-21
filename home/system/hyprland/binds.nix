{
  xdg.configFile."hypr/binds.conf".text = ''
    $mod = SUPER

     

    bind = $mod, RETURN, exec, kitty

    bind = $mod, BACKSPACE, killactive, 
    bind = $mod, M, exit, 
    bind = $mod, V, togglefloating, 
    bind = ALT, F, fullscreen,
    bind = $mod, P, pseudo,



    bind = $mod, D, exec, wofi


    bind =, Home, exec, wl-screenrec --audio -f $HOME/Media/Videos/$(date +%d%m%y%H-%s.mp4)
    bind =, End, exec, pkill wl-screenrec

   bind = , Print, exec, sh ~/.config/hypr/scripts/screenshot si                                                                                                                                                                  
   bind = SUPER, Print, exec, sh ~/.config/hypr/scripts/screenshot ri                                                                                                                                                        
   bind = SHIFT, Print, exec, sh ~/.config/hypr/scripts/screenshot p

    bind = ALT, G, togglegroup

    bind = $mod, H, movefocus, l
    bind = $mod, J, movefocus, d
    bind = $mod, L, movefocus, r
    bind = $mod, K, movefocus, u

    bind = $mod CTRL, H, swapwindow, l
    bind = $mod CTRL, L, swapwindow, r
    bind = $mod CTRL, K, swapwindow, u
    bind = $mod CTRL, J, swapwindow, d

    binde = $mod SHIFT, H, resizeactive, -20 0
    binde = $mod SHIFT, J, resizeactive, 0 -20
    binde = $mod SHIFT, K, resizeactive, 0 20
    binde = $mod SHIFT, L, resizeactive, 20 0

    bind = $mod, 1, workspace, 1
    bind = $mod, 2, workspace, 2
    bind = $mod, 3, workspace, 3
    bind = $mod, 4, workspace, 4
    bind = $mod, 5, workspace, 5
    bind = $mod, 6, workspace, 6
    bind = $mod, 7, workspace, 7
    bind = $mod, 8, workspace, 8
    bind = $mod, 9, workspace, 9
    bind = $mod, 0, workspace, 10

    bind = $mod SHIFT, 1, movetoworkspace, 1
    bind = $mod SHIFT, 2, movetoworkspace, 2
    bind = $mod SHIFT, 3, movetoworkspace, 3
    bind = $mod SHIFT, 4, movetoworkspace, 4
    bind = $mod SHIFT, 5, movetoworkspace, 5
    bind = $mod SHIFT, 6, movetoworkspace, 6
    bind = $mod SHIFT, 7, movetoworkspace, 7
    bind = $mod SHIFT, 8, movetoworkspace, 8
    bind = $mod SHIFT, 9, movetoworkspace, 9
    bind = $mod SHIFT, 0, movetoworkspace, 10

    bindm = $mod, mouse:272, movewindow
    bindm = $mod, mouse:273, resizewindow
  '';
}
