class Msxiv < Formula
  desc "Neo Simple X Image Viewer for macOS (Apple Silicon native)"
  homepage "https://github.com/superhexxxy/msxiv"
  url "https://github.com/superhexxxy/msxiv/archive/refs/tags/v1.0.6.tar.gz"
  sha256 "79b7af2b1032cb16f283dfa1f35112c482c9d9c05ca456cbe4ee79683cf724b5"
  license "WTFPL"

  depends_on macos: :ventura

  def install
    system "make"
    bin.install ".build/release/msxiv"
    (etc/"msxiv").install "config.example" => "config"
  end

  def caveats
    <<~EOS
      mkdir -p ~/.config/msxiv
      cp #{etc}/msxiv/config ~/.config/msxiv/config
    EOS
  end

  test do
    system "#{bin}/msxiv", "--help"
  end
end
