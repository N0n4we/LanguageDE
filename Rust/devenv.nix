{ pkgs, lib, config, inputs, ... }:

{
  env.GREET = "devenv";

  packages = with pkgs; [
    git
    # Tauri 依赖
    pkg-config
    glib.dev
    gtk3.dev
    webkitgtk_4_1.dev
    libsoup_3.dev
    cairo.dev
    pango.dev
    gdk-pixbuf.dev
    atk.dev
    openssl.dev
  ];

  languages.rust.enable = true;

  scripts.hello.exec = ''
    echo hello from $GREET
  '';

  enterShell = ''
    hello
    git --version
  '';

  enterTest = ''
    echo "Running tests"
    git --version | grep --color=auto "${pkgs.git.version}"
  '';
}
