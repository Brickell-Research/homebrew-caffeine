class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "4.5.1"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.5.1/caffeine-4.5.1-macos-x64.tar.gz"
    sha256 "ad74e133741fd06a838d3a146f54f2ec29fda93014795ff47235aa6dd2c6ec61"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.5.1/caffeine-4.5.1-macos-arm64.tar.gz"
    sha256 "d45aec0b3040b9d248a94172137727891e597f3a43abcc246a6f1fe9e851177c"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.5.1/caffeine-4.5.1-linux-x64.tar.gz"
    sha256 "68777ea6713c75e88e99abc8812dacff38fa249bf5b0499ffd254903fa7242a7"
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
