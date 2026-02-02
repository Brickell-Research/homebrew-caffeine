class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "4.0.4"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.0.4/caffeine-4.0.4-macos-x64.tar.gz"
    sha256 "f6235cea3d615ffd114b8595402dd2bb7cbe9bf491ee5a4bd34ffbc15a74829c"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.0.4/caffeine-4.0.4-macos-arm64.tar.gz"
    sha256 "5dcf9ea801435f054659eea6745366f4e5bdc297892e2c28309f106d0cdcf9d6"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.0.4/caffeine-4.0.4-linux-x64.tar.gz"
    sha256 "bfea4fd0aaf2f6c66cf7de2dc9000c47a7ae440441bdc2167cf010fa83068d3d"
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
