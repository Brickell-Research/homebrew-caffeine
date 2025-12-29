class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "2.0.4"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v2.0.4/caffeine-2.0.4-macos-x64.tar.gz"
    sha256 "1e91307e09e33f2e71bdfebd50da8f2940328040df7b9f10234cfe82e585cf3c"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v2.0.4/caffeine-2.0.4-macos-arm64.tar.gz"
    sha256 "e7c754020d3fad55bd87f3097278a6d5967c5a8f0c6e280443a1b37b61a4d131"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v2.0.4/caffeine-2.0.4-linux-x64.tar.gz"
    sha256 "73076387ee7f4ade0577e36f8c8c2bd8557dbb1a29c1a8ab06db69dec276dd9d"
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
