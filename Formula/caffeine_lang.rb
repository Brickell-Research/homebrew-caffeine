class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "3.0.10"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v3.0.10/caffeine-3.0.10-macos-x64.tar.gz"
    sha256 "60d369812f9ad73ef015cf320586af29b9cdf03e04ffee16ecc844600d3197c0"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v3.0.10/caffeine-3.0.10-macos-arm64.tar.gz"
    sha256 "ca3367b19b385c6940fdbd4373ef0b512a204b42463bf1ffad1dc988012b0a45"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v3.0.10/caffeine-3.0.10-linux-x64.tar.gz"
    sha256 "abee7ec6c7e1cf6e486ac475f1e9ea720c36056009e91438abdca665b9a0729d"
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
