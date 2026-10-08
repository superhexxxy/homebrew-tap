class Msxiv < Formula
  desc "Neo Simple X Image Viewer for macOS (Apple Silicon native)"
  homepage "https://github.com/superhexxxy/msxiv"
  url "https://github.com/superhexxxy/msxiv/archive/refs/tags/v1.0.3.tar.gz"
  sha256 "cd6c20af864e3fe2eb7216a8fd29a38f7af972a790b83630b6787596b643bc2a"
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
