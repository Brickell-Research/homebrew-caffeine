class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "4.6.3"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.6.3/caffeine-4.6.3-macos-x64.tar.gz"
    sha256 "d5534c5b5decc636c28018baf57353147a41157f5eda7cc04afb9df93d386e4d"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.6.3/caffeine-4.6.3-macos-arm64.tar.gz"
    sha256 "44a62ebb04e695dad347933e977eb4a5fe102871d2c6e68c541837c572f6aeee"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.6.3/caffeine-4.6.3-linux-x64.tar.gz"
    sha256 "14c19ed6081d5680b55db3de749c9fec88d0dd6f55a86adda8cfc94598573ad1"
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
