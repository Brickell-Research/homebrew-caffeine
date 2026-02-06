class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "4.1.2"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.1.2/caffeine-4.1.2-macos-x64.tar.gz"
    sha256 "b9facabe56c33fb57c500f9e2cb81be7de2a519456783b115e3ebc4b6d1b72fc"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.1.2/caffeine-4.1.2-macos-arm64.tar.gz"
    sha256 "17977e5979d5d80760171f22ef8a256824f57591bb027bbd0074388d394cb7f8"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.1.2/caffeine-4.1.2-linux-x64.tar.gz"
    sha256 "7ad068545e60f01ebdf2aef4b77f2864f6cb6a6dbbd224e4d285dcd06922e045"
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
