class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "2.0.0"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v2.0.0/caffeine-2.0.0-macos-x64.tar.gz"
    sha256 "8d65f522eec0d9e4e9fbb15e841301e25aa5696d545f6f40fad12f03eec3bdb4"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v2.0.0/caffeine-2.0.0-macos-arm64.tar.gz"
    sha256 "c689a2f6727d1f6e6d56f449abce4775457dd90c03e71aef5235580255ba6782"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v2.0.0/caffeine-2.0.0-linux-x64.tar.gz"
    sha256 "4c56c1ceb0e4828d1a1d868f574c739800af50fd2124d6a4884b0d34d484d9b4"
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
