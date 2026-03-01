class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "4.6.2"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.6.2/caffeine-4.6.2-macos-x64.tar.gz"
    sha256 "91161e1727fe576b2afda15f8c05e0e9c617b8794acd89f7d0dea2a2bd85b081"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.6.2/caffeine-4.6.2-macos-arm64.tar.gz"
    sha256 "bb424d6268bbe17b19a6110419b640a52210a118575cfd72f77ee2a49c3827bb"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.6.2/caffeine-4.6.2-linux-x64.tar.gz"
    sha256 "08b1e4f3656e5d739f33e00517eb4d556c8c9dd280306e58d38d4bf67bd72328"
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
