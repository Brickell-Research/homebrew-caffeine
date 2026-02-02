class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "4.0.3"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.0.3/caffeine-4.0.3-macos-x64.tar.gz"
    sha256 "91a401b17b8835456bf9a9844bddc860344cfd1e4ba5e05aa6efd3cc05ad94db"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.0.3/caffeine-4.0.3-macos-arm64.tar.gz"
    sha256 "194738d74df3357ad00bdc68ae3d3a5377b33b61f039622141f157b99b74de67"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.0.3/caffeine-4.0.3-linux-x64.tar.gz"
    sha256 "7bc626e2b11b82e9b1e28397922f03116c174ebe5fe276fad57fa8b64157b6b9"
  end

  def install
    # The binary name includes version and platform, rename to just "caffeine"
    if OS.mac? && Hardware::CPU.intel?
      bin.install "caffeine-#{version}-macos-x64" => "caffeine"
    elsif OS.mac? && Hardware::CPU.arm?
      bin.install "caffeine-#{version}-macos-arm64" => "caffeine"
    elsif OS.linux? && Hardware::CPU.intel?
      bin.install "caffeine-#{version}-linux-x64" => "caffeine"
    end
  end

  test do
    system "#{bin}/caffeine"
  end
end
