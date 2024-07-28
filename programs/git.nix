{
  enable = true;

  userName = "Ari";
  userEmail = "159862637+ari-kl@users.noreply.github.com";

  signing = {
    signByDefault = false;
    key = "";
  };

  # Use delta pager for diffs
  delta = {
    enable = true;
  };

  extraConfig = {
    init.defaultBranch = "main";
  };
}
