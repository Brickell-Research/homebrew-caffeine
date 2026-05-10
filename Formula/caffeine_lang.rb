class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "5.4.3"

  # Platform-specific downloads — binaries hosted on the caffeine repo
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v5.4.3/caffeine-5.4.3-macos-x64.tar.gz"
    sha256 "43c0d61e59cc93f61b2f41eb53c0060c4ee1010a5367ea1e8c3c05baf83f42d2"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v5.4.3/caffeine-5.4.3-macos-arm64.tar.gz"
    sha256 "6f06363ca3f65134cc2e8f7f96d1103e010b652f7931c9cf932edc289efc6fba"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v5.4.3/caffeine-5.4.3-linux-x64.tar.gz"
    sha256 "2dae44fb11f991e8bd574a1861cd4e524e3d429ab51ab4318cf916deb98781b1"
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
