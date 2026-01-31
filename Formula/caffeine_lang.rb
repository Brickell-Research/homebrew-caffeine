class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "3.0.24"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v3.0.24/caffeine-3.0.24-macos-x64.tar.gz"
    sha256 "7ff9749ccd6c2fa56a5f782a1f49a396cdfaf18ff9209bd2206b1c14e7fe64fc"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v3.0.24/caffeine-3.0.24-macos-arm64.tar.gz"
    sha256 "f430a54663fc5dad21b1adc92c02cb9228c6c175fc4403bafc40e4c0b83b5a78"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v3.0.24/caffeine-3.0.24-linux-x64.tar.gz"
    sha256 "2fe1e2ada04f706e2b7fe6c0be9327f94fa8bc7fae870fe1d01d50a429318749"
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
