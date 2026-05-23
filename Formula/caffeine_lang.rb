class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "6.2.2"

  # Platform-specific downloads — binaries hosted on the caffeine repo
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v6.2.2/caffeine-6.2.2-macos-x64.tar.gz"
    sha256 "7b1f798872a866bd2f2ff3b2cdca5122e17a34e5bc91566137dec32bb6afdda6"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v6.2.2/caffeine-6.2.2-macos-arm64.tar.gz"
    sha256 "b5188a4c798ad6e06d9433eb6676bf9b00c4356e0244383831a22d2396ed1891"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v6.2.2/caffeine-6.2.2-linux-x64.tar.gz"
    sha256 "1de3f2d0bef587ac4247d5a169c31f90bd1c3c385c9ee3a5d6bee89bbdff577b"
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
