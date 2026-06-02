class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "6.3.1"

  # Platform-specific downloads — binaries hosted on the caffeine repo
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v6.3.1/caffeine-6.3.1-macos-x64.tar.gz"
    sha256 "141bf33c1d3a051f5910442dd36d3c9851a33a367be2ab048cb87dd6a2b01c9a"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v6.3.1/caffeine-6.3.1-macos-arm64.tar.gz"
    sha256 "7875a2c7b8137e063b701baa80ec13501124a3ccea82bceb2dea045d15cc13b5"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v6.3.1/caffeine-6.3.1-linux-x64.tar.gz"
    sha256 "dcece82c58f5c0f66ced3959721bba8621a0733b1d316e3b152944053854b8c2"
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
