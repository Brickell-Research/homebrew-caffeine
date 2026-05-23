class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "6.3.0"

  # Platform-specific downloads — binaries hosted on the caffeine repo
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v6.3.0/caffeine-6.3.0-macos-x64.tar.gz"
    sha256 "c632c1bab737bbebbb17c0ba81aa8f9eab79ffdaee2a973af5ccbf957e913041"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v6.3.0/caffeine-6.3.0-macos-arm64.tar.gz"
    sha256 "8f0c2530844625aae483c1121124c34338d4774578d91ef997133f3ed1c801c8"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v6.3.0/caffeine-6.3.0-linux-x64.tar.gz"
    sha256 "1ed76dc227b8ce09abae5ed48f1577f60b1cf49993c2d87c1e03c08c9ce7e40e"
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
