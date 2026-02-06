class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "4.2.0"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.2.0/caffeine-4.2.0-macos-x64.tar.gz"
    sha256 "11920567a329fd134f41b6a6831ee3568ee9d264bfda880338ae3c3fe8402917"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.2.0/caffeine-4.2.0-macos-arm64.tar.gz"
    sha256 "e18977abc522f08138081e58f98a8af87a8aafb94f386a4f97e4c7a104f570b1"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.2.0/caffeine-4.2.0-linux-x64.tar.gz"
    sha256 "e18a2dc4f3a0dfd223efa913f860a0da701ec1d3672d85fd3be402e1d35c0f3e"
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
