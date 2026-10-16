cask "msxpet" do
  version "0.1.1"
  sha256 "2883a599efb4d5f500a9b8e851dde2edfc3650d8feca6859a0128a9906ef2c40"

  url "https://github.com/superhexxxy/MSXPET/releases/download/v#{version}/MSXPET.zip"
  name "MSXPET"
  desc "Super pawsome native macOS desktop pet"
  homepage "https://github.com/superhexxxy/MSXPET"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: :ventura

  app "MSXPET.app"

  zap trash: [
    "~/Library/Application Support/MSXPET",
    "~/Library/Preferences/com.msxpet.app.plist",
  ]
end
