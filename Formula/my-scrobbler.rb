class MyScrobbler < Formula
  desc "my headless scrobbler for Apple Music"
  homepage "https://github.com/mishazawa/my_scrobbler"
  url "/my_scrobbler"
  sha256 "59a3aa93bb51bc923157b37be2528f2b1b5dd3ea9a63796b60bce10715c3327f"
  version "1.0.0"

  def install
    bin.install "my_scrobbler"
  end

  # THIS IS THE BACKGROUND MAGIC
  service do
    run opt_bin/"my_scrobbler"
    keep_alive true
    run_at_load true
    log_path var/"log/my_scrobbler.log"
    error_log_path var/"log/my_scrobbler.err.log"
  end

  def caveats
    <<~EOS
      To make my_scrobbler work, you must create a configuration file at:
        ~/.config/my_scrobbler/config.env

      Add your Last.fm credentials:
        LASTFM_API_KEY="your_api_key"
        LASTFM_API_SECRET="your_secret"
        LASTFM_USERNAME="your_username"

      And create credentials in keychain:
        security add-generic-password -U -s "my-scrobbler" -a <USERNAME> -w <PASSWORD>
      
      Once configured, start the background service with:
        brew services start my_scrobbler
    EOS
  end
end