{
  config,
  pkgs,
  ...
}: {
  # Configure MPD service
  services.mpd = {
    enable = true;
    musicDirectory = "~/Music"; # Path to your music directory
    extraConfig = ''
      audio_output {
        type "pulse"
        name "PulseAudio"
      }
      bind_to_address "127.0.0.1"
      port "6600"
    '';
    dataDir = "~/.config/mpd"; # Where MPD stores its database and other files
  };
}
