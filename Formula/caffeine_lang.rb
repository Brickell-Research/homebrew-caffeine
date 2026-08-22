class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "6.3.2"

  # Platform-specific downloads — binaries hosted on the caffeine repo
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v6.3.2/caffeine-6.3.2-macos-x64.tar.gz"
    sha256 "701556c9edacec162aabc41f8ad57a087cbff0c29bd400615e47473efcb0e4f9"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v6.3.2/caffeine-6.3.2-macos-arm64.tar.gz"
    sha256 "9abd17a26fcbbd4427d0807a8ac3b11e065a89bb1ab1d3317014b12c05ce9722"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v6.3.2/caffeine-6.3.2-linux-x64.tar.gz"
    sha256 "5da6448ae4c3b2a7f7b08caa6f07ace8a6244bbf3a7c3908ee2b21e5445ca6d1"
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
