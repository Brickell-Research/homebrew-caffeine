class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "3.0.22"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v3.0.22/caffeine-3.0.22-macos-x64.tar.gz"
    sha256 "b9819875a10eff22576a79f06829854858aa8a4f637d5d67a4593ff3f2488a11"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v3.0.22/caffeine-3.0.22-macos-arm64.tar.gz"
    sha256 "05afadb07757ff8045dac4df53edc888c668d024dd081a38134ac0efff166b12"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v3.0.22/caffeine-3.0.22-linux-x64.tar.gz"
    sha256 "c49fc40c5f1db9359c21210b411715103d1a93bbee51142a3ca5716bb3c103d8"
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
