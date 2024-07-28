{ pkgs, ... }: {
  enable = true;

  shellInit = ''
    # Load Homebrew
    eval "$(/opt/homebrew/bin/brew shellenv)"

    # Stop Greeting
    set fish_greeting

    # Full Path (disable truncation)
    set fish_prompt_pwd_dir_length 0

    # Initialize zoxide
    ${pkgs.zoxide}/bin/zoxide init fish | source
  '';
}
