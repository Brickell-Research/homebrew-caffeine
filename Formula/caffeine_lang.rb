class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "5.0.9"

  # Platform-specific downloads — binaries hosted on the caffeine repo
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v5.0.9/caffeine-5.0.9-macos-x64.tar.gz"
    sha256 "527228c815ec05bd31eefb3ba1785b9d2efa91a611ada4f761893e5548a08f74"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v5.0.9/caffeine-5.0.9-macos-arm64.tar.gz"
    sha256 "dd1cb4263fa66077980b6e3842908ff80176a1044e09d59cee8d7c88ba0cffc9"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v5.0.9/caffeine-5.0.9-linux-x64.tar.gz"
    sha256 "dd1711d71414f3ddc7162a53b8a000c9f5decd1c1309787865d80654b130cda5"
  end

  def install
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
