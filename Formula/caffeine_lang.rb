class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "5.4.0"

  # Platform-specific downloads — binaries hosted on the caffeine repo
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v5.4.0/caffeine-5.4.0-macos-x64.tar.gz"
    sha256 "eeb83f35779b9f4a05c40fcbee32c29fd4273ed5eb2db0f7797dda1a829a84a4"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v5.4.0/caffeine-5.4.0-macos-arm64.tar.gz"
    sha256 "87e7fd0ef025f7ea4e6b3aee35b0b988d5a6883fe8bb74a2f1067de04dc1b5d8"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v5.4.0/caffeine-5.4.0-linux-x64.tar.gz"
    sha256 "a29ef23a2f035d66f0a4efff6f08940a4c90fd6de051cc093e2d5268c82ebc1d"
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
