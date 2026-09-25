cask "atbang" do
  version "1.0.0"
  sha256 "1186d1f11440181a3f70fce126128dfb68e34c9c279262582e8a8770508f13c6"

  url "https://github.com/alexandre-daubois/atbang/releases/download/v#{version}/Atbang-#{version}.zip"
  name "Atbang"
  desc "Menu bar app that triages GitHub notifications with Claude"
  homepage "https://github.com/alexandre-daubois/atbang"

  depends_on formula: "gh"
  depends_on macos: :tahoe

  app "Atbang.app"

  # The app is signed ad hoc and not notarized, so Gatekeeper refuses to open it while it is quarantined.
  postflight_steps do
    run "/usr/bin/xattr",
        args:           ["-dr", "com.apple.quarantine", "{{appdir}}/Atbang.app"],
        must_succeed:   false,
        writable_paths: ["Atbang.app"],
        writable_base:  :appdir
  end

  zap trash: [
    "~/Library/Caches/Atbang",
    "~/Library/Preferences/dev.daubois.Atbang.plist",
  ]
end
