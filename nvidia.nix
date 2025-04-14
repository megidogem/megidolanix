{ config, pkgs, ... }:

{
  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement = {
      enable = false;         # Experimental, might cause sleep issues
      finegrained = false;    # Fine-grained power management (Turing+ only)
    };
    open = true;
    package = config.boot.kernelPackages.nvidiaPackages.beta;
    nvidiaSettings = false;
  };
}
