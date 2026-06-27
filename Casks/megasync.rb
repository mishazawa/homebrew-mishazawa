cask "megasync" do
  arch arm: "Arm64"

  version "6.4.0.2"
  sha256 :no_check # MEGA serves dynamic files, or you can supply a specific hash if pinning a specific version

  url "https://mega.nz/MEGAsyncSetupArm64.dmg"
  name "MEGAsync"
  desc "Syncs files between computers and MEGA Cloud drives"
  homepage "https://mega.io/desktop"

  livecheck do
    url "https://mega.nz/MEGAsyncSetupArm64.dmg"
  end

  auto_updates true
  depends_on :macos

  app "MEGAsync.app"

  uninstall launchctl: "mega.mac.megaupdater",
            quit:      "mega.mac",
            login_item: "MEGAsync"

  zap trash: [
    "~/Library/Application Scripts/mega.mac.MEGAShellExtFinder",
    "~/Library/Application Scripts/T9RH74Y7L9.mega.mac",
    "~/Library/Application Support/Mega Limited",
    "~/Library/Group Containers/T9RH74Y7L9.mega.mac",
    "~/Library/HTTPStorages/mega.mac",
    "~/Library/LaunchAgents/mega.mac.megaupdater.plist",
    "~/Library/Preferences/mega.mac.plist",
  ]
end