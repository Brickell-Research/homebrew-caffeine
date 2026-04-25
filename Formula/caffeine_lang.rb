class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "5.0.12"

  # Platform-specific downloads — binaries hosted on the caffeine repo
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v5.0.12/caffeine-5.0.12-macos-x64.tar.gz"
    sha256 "f95737858a1e796d526712b1a1b1079443beee7c039f00af194d42586cc7181e"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v5.0.12/caffeine-5.0.12-macos-arm64.tar.gz"
    sha256 "ced1d168e313dddf4d5aec8275dd2c2a8d4a6ccd6ba13045f641c82127b5be0a"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v5.0.12/caffeine-5.0.12-linux-x64.tar.gz"
    sha256 "59212db3947eade25cf6c20dd29d40aa206170c5b28fe35b37c3c3e2163fb476"
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
