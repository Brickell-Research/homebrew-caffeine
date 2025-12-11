class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  version "0.2.8"
  license "GPL-3.0-only"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v0.2.8/caffeine-0.2.8-macos-x64.tar.gz"
    sha256 "ab00bd1dcaf24e7021e9ff0afb9fcf9493d8cc3e155d7825aa527f76bd888039"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v0.2.8/caffeine-0.2.8-macos-arm64.tar.gz"
    sha256 "422d0211af7bcd4d85cfb32f08a6c5aca4fa7a394ea44de8ae6f5a243162b5e1"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v0.2.8/caffeine-0.2.8-linux-x64.tar.gz"
    sha256 "c3764ee633d57ca0b339b88952e06235827bc9f5b1b9d9081e4f84917ee7a472"
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
