class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "5.3.0"

  # Platform-specific downloads — binaries hosted on the caffeine repo
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v5.3.0/caffeine-5.3.0-macos-x64.tar.gz"
    sha256 "70821da773ffccf94aacbbf684e707cb91c67019cb45ba1f5b824fbf31410d09"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v5.3.0/caffeine-5.3.0-macos-arm64.tar.gz"
    sha256 "04e25d315792c3c927145b47af19d67c3229d85e74e3ec261f1f15ab8f4470db"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v5.3.0/caffeine-5.3.0-linux-x64.tar.gz"
    sha256 "f9bd1b1a9d8c8b49d3d1f47c0ea94bda7ecd22c9fd21c68771d5bfcc87f03099"
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
