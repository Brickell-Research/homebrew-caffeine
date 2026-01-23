class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "3.0.9"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v3.0.9/caffeine-3.0.9-macos-x64.tar.gz"
    sha256 "93b233ea542348c4a04e6c89fb3f5051d171307d85c5ca3f531af6f4e9e45f1b"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v3.0.9/caffeine-3.0.9-macos-arm64.tar.gz"
    sha256 "2e93714ca705fd78eeaed2e414fcce07b7579a1c2f80696f160c2eee23327c1b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v3.0.9/caffeine-3.0.9-linux-x64.tar.gz"
    sha256 "f9810baff6f9ef5ebfedf23e54596f1f1adb2aebd3441249202c46a5d35e678c"
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
