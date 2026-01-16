class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "3.0.1"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v3.0.1/caffeine-3.0.1-macos-x64.tar.gz"
    sha256 "e722213d06e1dad7df46332afc5885b2d588c36cc80f8e8b952e3b0d7ca6c105"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v3.0.1/caffeine-3.0.1-macos-arm64.tar.gz"
    sha256 "16bd30c04c39e8a23c3fb136e0a508e4a0a02b51c59a14a7001bf6a1ebedba86"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v3.0.1/caffeine-3.0.1-linux-x64.tar.gz"
    sha256 "56bf90870aea72f879fe77b235a1dd14eb6d34c60cbef78a3baae3ce47e24e65"
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
