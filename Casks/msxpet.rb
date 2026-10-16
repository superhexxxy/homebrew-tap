cask "msxpet" do
  version "0.1.0"
  sha256 "a0870be045dec7b84449042f9474a45032446211170bb90561a520c8020a3035"

  url "https://github.com/superhexxxy/MSXPET/releases/download/v#{version}/MSXPET.zip"
  name "MSXPET"
  desc "Super pawsome native macOS desktop pet"
  homepage "https://github.com/superhexxxy/MSXPET"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :ventura"

  app "MSXPET.app"

  zap trash: [
    "~/Library/Application Support/MSXPET",
    "~/Library/Preferences/com.msxpet.app.plist",
  ]
end
