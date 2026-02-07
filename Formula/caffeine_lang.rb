class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "4.3.4"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.3.4/caffeine-4.3.4-macos-x64.tar.gz"
    sha256 "77fa9e0ff46bccab80091d1fa7e52404c2f1794685461bf9f3e06219c74d0560"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.3.4/caffeine-4.3.4-macos-arm64.tar.gz"
    sha256 "9f560f4d94ca80df8a4a1f904494ab703bf2904a2b991cdb61e64fc8701a7a8b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.3.4/caffeine-4.3.4-linux-x64.tar.gz"
    sha256 "3b709bb0c1ad7a497d37a6be2117bb821cde009dc8511bf55b40c3955a1ca53a"
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
