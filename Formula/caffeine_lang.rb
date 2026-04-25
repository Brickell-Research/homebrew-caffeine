class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "5.1.1"

  # Platform-specific downloads — binaries hosted on the caffeine repo
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v5.1.1/caffeine-5.1.1-macos-x64.tar.gz"
    sha256 "6b53211920e69397c44173389924a4b8d5aeec2a807fe40b57e9f21fd685dd68"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v5.1.1/caffeine-5.1.1-macos-arm64.tar.gz"
    sha256 "c1b41c4cfb92cfcacaad5be67b75b1bd211fdb8a416debbad5caec045b6f5a63"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v5.1.1/caffeine-5.1.1-linux-x64.tar.gz"
    sha256 "1fdda43a63e2803f4d1b643f6c09235324fdff6cb04d239e8aca65d2cca17b44"
  end

  def install
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
