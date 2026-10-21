cask "t-utilities" do
  version "0.1.5"
  sha256 "24fdf1d6c9be6e7bf1fdb8f7850dc09bb65b9b6312bd99b16ded821f5e77250b"

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
