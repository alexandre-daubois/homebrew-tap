cask "atbang" do
  version "1.0.2"
  sha256 "9f2f0a9e08c4169772cd3fb0e26a3e27f4368d28c4b8456a99e32d92a71cf181"

  url "https://github.com/alexandre-daubois/atbang/releases/download/v#{version}/Atbang-#{version}.zip"
  name "Atbang"
  desc "Menu bar app that triages GitHub notifications with Claude"
  homepage "https://github.com/alexandre-daubois/atbang"

  depends_on formula: "gh"
  depends_on macos: :tahoe

  app "Atbang.app"

  zap trash: [
    "~/Library/Caches/Atbang",
    "~/Library/Preferences/dev.daubois.Atbang.plist",
  ]
end
