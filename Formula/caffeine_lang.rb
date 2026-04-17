class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "5.0.10"

  # Platform-specific downloads — binaries hosted on the caffeine repo
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v5.0.10/caffeine-5.0.10-macos-x64.tar.gz"
    sha256 "a86fcec8f0ab675c8109994b291b0177c67013f5201acef72871511884a8ff6d"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v5.0.10/caffeine-5.0.10-macos-arm64.tar.gz"
    sha256 "9d360ecd60e1d78a1d4c9e27311ce0829e59966eb0b7f9c7cf3f5417343b560a"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v5.0.10/caffeine-5.0.10-linux-x64.tar.gz"
    sha256 "6758ac5fe71614aa96f8dc4a95ae705fabafb882fa2aeed8d6148773d2d1fdf6"
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
