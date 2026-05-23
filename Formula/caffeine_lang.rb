class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "6.1.1"

  # Platform-specific downloads — binaries hosted on the caffeine repo
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v6.1.1/caffeine-6.1.1-macos-x64.tar.gz"
    sha256 "4156016a371837b83697bd2d9d32f8987ff555ec100606cc4e242e5f9c91dac4"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v6.1.1/caffeine-6.1.1-macos-arm64.tar.gz"
    sha256 "37fb9848660b7ab9495813b112032839b247b4aa62a5c2410eadae1be19921dc"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v6.1.1/caffeine-6.1.1-linux-x64.tar.gz"
    sha256 "c3248bbdee42129107b1c127344fa76c5f7fcf6f2cc7e044d7eb65b6d9e91235"
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
