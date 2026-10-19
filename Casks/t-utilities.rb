cask "t-utilities" do
  version "0.1.0"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"

  url "https://github.com/mordol/T-Utilities/releases/download/v#{version}/T-Utilities-#{version}.zip"
  name "T-Utilities"
  desc "Modular menu bar utilities: clipboard, keep-awake, second clock, window moves, cable info"
  homepage "https://github.com/mordol/T-Utilities"

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: ">= :tahoe"

  app "T-Utilities.app"

  # Signed with a personal certificate, not notarized: clear quarantine so Gatekeeper does not block launch.
  postflight do
    system_command "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "#{appdir}/T-Utilities.app"]
  end

  uninstall quit: "com.taegyu.tutilities"

  zap trash: [
    "~/Library/Application Support/T-Utilities",
    "~/Library/Preferences/com.taegyu.tutilities.plist",
  ]
end
