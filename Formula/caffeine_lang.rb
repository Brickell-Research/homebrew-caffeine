class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "5.6.0"

  # Platform-specific downloads — binaries hosted on the caffeine repo
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v5.6.0/caffeine-5.6.0-macos-x64.tar.gz"
    sha256 "b98acb41f6352cb5ec4fbdcdf4e97cda2932d87a3229b0ad132eee8205ee9822"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v5.6.0/caffeine-5.6.0-macos-arm64.tar.gz"
    sha256 "ef8d4b42a6fdcc7b4ff1cf6c5e54094bb78f9434706b8ac9eef94aadc6daf252"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v5.6.0/caffeine-5.6.0-linux-x64.tar.gz"
    sha256 "bfc487690b46a76bc19bbccd5d3091bce7384e38426b5ab6a86434a74610f244"
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
