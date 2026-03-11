class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "4.8.3"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.8.3/caffeine-4.8.3-macos-x64.tar.gz"
    sha256 "886485da7a096cadf7cf39ef36dffb2bb762562d0685f6452d8bf6b08ea0ee8e"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.8.3/caffeine-4.8.3-macos-arm64.tar.gz"
    sha256 "20dd6b3668dfa43e4d390fcf2e877837ab60913b9bfcc6d2dd45116eaa9a084d"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.8.3/caffeine-4.8.3-linux-x64.tar.gz"
    sha256 "fc7295e7a36d30ae8717f86c94700b164d3df71ba2261a8e2cf4ec083e37aeb3"
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
