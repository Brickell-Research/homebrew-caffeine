class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "4.0.9"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.0.9/caffeine-4.0.9-macos-x64.tar.gz"
    sha256 "39e0e4fe2a9e3ede9d1c148e9ef5d7b7593203e43068cae0da02e902a8307252"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.0.9/caffeine-4.0.9-macos-arm64.tar.gz"
    sha256 "019782494288ab0dfc86a90e41f91fbfec2d03c92b66d0a2d3c41f049f784807"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.0.9/caffeine-4.0.9-linux-x64.tar.gz"
    sha256 "07a47cc8d7808a36d91cdec93b9c7c7ba9641d2691f16da48ed4ce61f1558df0"
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
