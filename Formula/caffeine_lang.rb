class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "6.3.3"

  # Platform-specific downloads — binaries hosted on the caffeine repo
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v6.3.3/caffeine-6.3.3-macos-x64.tar.gz"
    sha256 "c61bb9f19be9221c71f4e904cd4676f833a5496cd995995fde5222ec5e87d8a0"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v6.3.3/caffeine-6.3.3-macos-arm64.tar.gz"
    sha256 "029cd2ec46cacfb9c52d64dc9a9c76eb53bb8d18388df62f2d29a58c4539bd46"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v6.3.3/caffeine-6.3.3-linux-x64.tar.gz"
    sha256 "9f0f37a0445ed720d49c23a486b42e9451f3bfaa0949d11d20f71be3c1a2c82c"
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
