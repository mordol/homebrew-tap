cask "t-utilities" do
  version "0.1.11"
  sha256 "34977b910e3654197e05e5ea1f54b897cb191a662e38b1e7d772d0c826f79959"

  url "https://github.com/mordol/T-Utilities/releases/download/v#{version}/T-Utilities-#{version}.zip"
  name "T-Utilities"
  desc "Menu bar utilities: clipboard, keep-awake, second clock, windows, cable info"
  homepage "https://github.com/mordol/T-Utilities"

  auto_updates true
  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "T-Utilities.app"

  # Signed with a personal certificate, not notarized: clear quarantine so Gatekeeper does not block launch.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/T-Utilities.app"]
  end

  uninstall quit: "com.taegyu.tutilities"

  zap trash: [
    "~/Library/Application Support/T-Utilities",
    "~/Library/Preferences/com.taegyu.tutilities.plist",
  ]
end
