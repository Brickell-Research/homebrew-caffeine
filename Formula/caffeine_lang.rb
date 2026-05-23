class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "6.2.0"

  # Platform-specific downloads — binaries hosted on the caffeine repo
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v6.2.0/caffeine-6.2.0-macos-x64.tar.gz"
    sha256 "035c099f742d12fe21b668c4d81174c23af0d6e9f8bec72fc15d7df3cddfd614"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v6.2.0/caffeine-6.2.0-macos-arm64.tar.gz"
    sha256 "cbc1b5e7b03c9b542cfd0ed8c89e89b326f9b932bec2f8ddf77dc4527ef09756"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v6.2.0/caffeine-6.2.0-linux-x64.tar.gz"
    sha256 "984b5bd9cf7c7fb654c659564de55458f056f5f92b4da0b3ad0b47021a43de83"
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
