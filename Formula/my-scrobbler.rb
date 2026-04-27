class MyScrobbler < Formula
  desc "my headless scrobbler for Apple Music"
  homepage "https://github.com/mishazawa/my_scrobbler"
  url "https://github.com/mishazawa/my_scrobbler/releases/download/v0.1.0/my_scrobbler"
  sha256 "ba0cf23fbf3af10157399ab5e4db16e73726d94085f1ee33d1e342c07d1e20c4"
  version "0.1.0"

  def install
    # Drops your binary into the Homebrew binary folder (/opt/homebrew/bin)
    bin.install "my_scrobbler"
  end

  # THIS IS THE BACKGROUND MAGIC
  service do
    run opt_bin/"my_scrobbler"
    environment_variables PYTHONUNBUFFERED: "1"
    keep_alive true          # If it crashes, macOS automatically restarts it
    run_at_load true         # Start it automatically when the Mac boots up
    log_path var/"log/my_scrobbler.log"
    error_log_path var/"log/my_scrobbler.err.log"
  end

  def caveats
    <<~EOS
      To make mac-scrobbler work, you must create a configuration file at:
        ~/.config/mac-scrobbler/config.env

      Add your Last.fm credentials:
        LASTFM_API_KEY="your_api_key"
        LASTFM_API_SECRET="your_secret"
        LASTFM_USERNAME="your_username"
        LASTFM_PASSWORD_HASH="your_password_hash (md5)"

      Once configured, start the background service with:
        brew services start my_scrobbler
    EOS
  end
end