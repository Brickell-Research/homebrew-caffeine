class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "4.3.6"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.3.6/caffeine-4.3.6-macos-x64.tar.gz"
    sha256 "f16e2501e7e01303f8cc2a5500932c3a0530541820bf77ce0740c53ec54b0ead"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.3.6/caffeine-4.3.6-macos-arm64.tar.gz"
    sha256 "9447b5424128fab9583d59042d6c43113e57152e52271c9959ac8ad1f6f1ff51"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.3.6/caffeine-4.3.6-linux-x64.tar.gz"
    sha256 "f1a2267d18f12503a445fcbb29b5bc57d4ef5ab21022afa847c48fd58885a164"
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
