class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "3.0.20"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v3.0.20/caffeine-3.0.20-macos-x64.tar.gz"
    sha256 "6516210dac1e33d6e24aa4c5cbc886363bea24708751e9248b7b2665af539d1b"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v3.0.20/caffeine-3.0.20-macos-arm64.tar.gz"
    sha256 "242dc26337b74ffbcc2ede0e380c5cae81aa032a11959baa37661521d5b869cd"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v3.0.20/caffeine-3.0.20-linux-x64.tar.gz"
    sha256 "9ff288f381ca4b957332c6cb6dcd4c86eda03316418c196c97b41c66c6f0f85d"
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
