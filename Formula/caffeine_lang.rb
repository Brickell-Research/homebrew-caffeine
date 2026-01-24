class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "3.0.12"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v3.0.12/caffeine-3.0.12-macos-x64.tar.gz"
    sha256 "c2708279f0a14955bfb1badac8830c537e3cbe3232352f5956a163d9fc255da5"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v3.0.12/caffeine-3.0.12-macos-arm64.tar.gz"
    sha256 "ce79b0dd8397473cc7b347c819bc6c056148498bac7c19c84d323a69f944b4d2"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v3.0.12/caffeine-3.0.12-linux-x64.tar.gz"
    sha256 "6a4fa358dbddcb65126409c0ee3a0ea14e36ec5f92e2fb4f07d5fdfe39e778ae"
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
