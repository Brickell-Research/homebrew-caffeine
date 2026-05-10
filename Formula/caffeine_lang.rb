class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "5.4.4"

  # Platform-specific downloads — binaries hosted on the caffeine repo
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v5.4.4/caffeine-5.4.4-macos-x64.tar.gz"
    sha256 "31b9323549961c6460b272ba39a00048fc524eeb5924ec77a90d77b3729cb5ee"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v5.4.4/caffeine-5.4.4-macos-arm64.tar.gz"
    sha256 "56b485640f007fdbdcb1170caf8d146f6414c852bd6e85b6479d4518cb360a99"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v5.4.4/caffeine-5.4.4-linux-x64.tar.gz"
    sha256 "cc1f16520fdf8faeb689644ee49b5ded68eccdf55e567b164bf5c04db50b7157"
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
