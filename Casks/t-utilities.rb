cask "t-utilities" do
  version "0.1.3"
  sha256 "b3e6ed7647224a2718a5d05c9b5590b42c93f7e16cd3e6d58b628f614793706b"

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
