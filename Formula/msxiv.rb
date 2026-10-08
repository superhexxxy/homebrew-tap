class Msxiv < Formula
  desc "Neo Simple X Image Viewer for macOS (Apple Silicon native)"
  homepage "https://github.com/superhexxxy/msxiv"
  url "https://github.com/superhexxxy/msxiv/archive/refs/tags/v1.0.2.tar.gz"
  sha256 "0f62062c498c6333d427a013f523982ecf16838e9677d938deed2cf4e6bf23c0"
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
