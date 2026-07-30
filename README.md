## Links

Files or directories that should be linked to `~/.config/`:

- `fastfetch`
- `i3`
- `kitty`
- `nwg-displays`
- `rofi`
- `sway`
- `swaylock`
- `gtk-3.0`
- `nvim`

Files or directories that should be linked to `~/`:

- `vimrc` ==> `.vimrc`
- `Xresources` ==> `.Xresources`
- `bashrc` ==> `.bashrc`

Other destinations:

- `00-keyboard.conf` ==> `/etc/X11/xorg.conf.d/00-keyboard.conf`
- `30-touchpad.conf` ==> `/etc/X11/xorg.conf.d/30-touchpad.conf`

---

## Neovim

Configuration based on kickstart.nvim with some personal tweaks. Pretty proud of it :)

Maybe some day I will describe it more thoroughly.

### Note for future me

**Please DON'T use Wayland**

The best symlink command (so far) is: `ln -rs TARGET DIRECTORY`. Where `TARGET` is **the** file or
direcotory to be referenced and `DIRECTORY` is the *proper* file or directory location.
