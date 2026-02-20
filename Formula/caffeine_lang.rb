class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "4.4.4"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.4.4/caffeine-4.4.4-macos-x64.tar.gz"
    sha256 "045c9ca5fee127e10703764ab228cd48eff6be5c75c6e1e8802082a68d0cfeec"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.4.4/caffeine-4.4.4-macos-arm64.tar.gz"
    sha256 "51e3ca29f810848eb21218588212011453f158d3e11ee82c8a769c53b921d7fa"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.4.4/caffeine-4.4.4-linux-x64.tar.gz"
    sha256 "ddcf87cc4df789d2c8b5fd9e52760228a0e2c2fe27a30d4b886fb6874f194bff"
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
