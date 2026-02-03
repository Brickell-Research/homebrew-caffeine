class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "4.0.6"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.0.6/caffeine-4.0.6-macos-x64.tar.gz"
    sha256 "5785d087b2e359ffd3e95813786e20b75360a20e94f978a749609f476f9f0068"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.0.6/caffeine-4.0.6-macos-arm64.tar.gz"
    sha256 "455500ef9b2773bf7206242dd2cbbaa4ef17714ee82fd1106cb99ff20402e69a"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.0.6/caffeine-4.0.6-linux-x64.tar.gz"
    sha256 "d02b3a11f1cd33ebc13796eba3a77da0f0273025f92e35867c1601402a004f43"
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
