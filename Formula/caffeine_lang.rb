class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "5.4.2"

  # Platform-specific downloads — binaries hosted on the caffeine repo
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v5.4.2/caffeine-5.4.2-macos-x64.tar.gz"
    sha256 "86fbdb36dc7199367276681a91bf124b29a1559c127014d8efc9c087b928b8ca"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v5.4.2/caffeine-5.4.2-macos-arm64.tar.gz"
    sha256 "1eb5060bba458c435c9d025f7d15d24e8ff816ce421ad8e3c485488bd10a6d95"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v5.4.2/caffeine-5.4.2-linux-x64.tar.gz"
    sha256 "d126851c9868f22b6602fc30b12f544bb1fc3f16cb14536c8327dc680c3d4dfe"
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
