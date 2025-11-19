class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://github.com/Brickell-Research/caffeine_lang"
  version "0.1.2"
  license "GPL-3.0-only"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v.0.1.2/caffeine-0.1.2-macos-x64.tar.gz"
    sha256 "b58843c3db9b271926c4dca0c3532d48643d9892db26c76df035f6e34aef932b"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v.0.1.2/caffeine-0.1.2-macos-arm64.tar.gz"
    sha256 "e51392c5fae50381bd5af0c667177cdb8eb987a8c669ff9430c7239750108e3d"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v.0.1.2/caffeine-0.1.2-linux-x64.tar.gz"
    sha256 "52f94a737cf9f39039bede00786679b1a1ff066bb8ff9ba8c1094af74b0b7f1a"
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
