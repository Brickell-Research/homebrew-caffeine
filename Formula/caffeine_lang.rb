class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "4.9.0"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.9.0/caffeine-4.9.0-macos-x64.tar.gz"
    sha256 "6f4a9e18181020a6aebdafa1cbf93be1766229ad09033b3ed30e58f26e1b4345"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.9.0/caffeine-4.9.0-macos-arm64.tar.gz"
    sha256 "2165884603bd3308005d87f852dfc9bba818b66f67d3bdfc32d51436c8c00bc9"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.9.0/caffeine-4.9.0-linux-x64.tar.gz"
    sha256 "017414f3de82c35c4fbd9207cb9b35dea970184c8af36a1fb6ffb447c6865fb5"
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
