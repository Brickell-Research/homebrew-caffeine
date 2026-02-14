class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "4.4.1"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.4.1/caffeine-4.4.1-macos-x64.tar.gz"
    sha256 "beb5c79a5c4463991be10149c966f030e1a5994dfb4c3d08edd92b30bf25f8a4"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.4.1/caffeine-4.4.1-macos-arm64.tar.gz"
    sha256 "5484f73c3ac499298764b5a87c016ab248eba483895c766d097a8b13dbbda465"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.4.1/caffeine-4.4.1-linux-x64.tar.gz"
    sha256 "47e19575d5936c1abd05abf986df89cf0b4373127df80d9c5a76dc5c58c01011"
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
