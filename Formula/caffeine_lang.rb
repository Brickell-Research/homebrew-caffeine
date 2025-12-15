class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "1.0.0"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v1.0.0/caffeine-1.0.0-macos-x64.tar.gz"
    sha256 "b67df29a776016b1a15680dbea100382231577cf5b695c67959f6f468b59a6f2"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v1.0.0/caffeine-1.0.0-macos-arm64.tar.gz"
    sha256 "d54d005eb5f921ce89b3aacbc49ecf13836725b479f9e33c210138dc1341300e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v1.0.0/caffeine-1.0.0-linux-x64.tar.gz"
    sha256 "9a12123240524b422bb3fe3a56bbe4dba115ef7bb6fe3928e115313f6fc5bfb8"
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
