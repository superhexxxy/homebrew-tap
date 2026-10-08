class Msxiv < Formula
  desc "Neo Simple X Image Viewer for macOS (Apple Silicon native)"
  homepage "https://github.com/superhexxxy/msxiv"
  url "https://github.com/superhexxxy/msxiv/archive/refs/tags/v1.0.1.tar.gz"
  sha256 "325ab79587988118819f4e1ef39a1abcab4554cfa69aaa97cd941443bd764d2a"
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
