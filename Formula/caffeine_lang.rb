class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "4.6.4"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.6.4/caffeine-4.6.4-macos-x64.tar.gz"
    sha256 "2d3f711fa79fd632db618e956ceb577a7d99bf223fa4023f2bdcd6a4988719b2"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.6.4/caffeine-4.6.4-macos-arm64.tar.gz"
    sha256 "d6d964b8c18ad7faa1f7e8ecf73cb3bf3d4fce9f1c3d9f391c4ab59da4fd7951"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.6.4/caffeine-4.6.4-linux-x64.tar.gz"
    sha256 "17261b6fbfe3efef59c68889b78bca823afeaaf29a584457a03a339888af2436"
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
