{ config, pkgs, ... }:

{
  # NVIDIA configuration
  hardware.nvidia = {
    # Modesetting is required
    modesetting.enable = true;

    # Power management
    powerManagement = {
      enable = false;         # Experimental, might cause sleep issues
      finegrained = false;    # Fine-grained power management (Turing+ only)
    };

    # Use open source kernel module
    open = true;             # Requires driver 515.43.04+ and compatible GPU

    # Package selection
    package = config.boot.kernelPackages.nvidiaPackages.beta;
    nvidiaSettings = false;  # Enable NVIDIA settings menu
  };
}
