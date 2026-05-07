class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "5.4.1"

  # Platform-specific downloads — binaries hosted on the caffeine repo
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v5.4.1/caffeine-5.4.1-macos-x64.tar.gz"
    sha256 "58481a22687774f5b1c23a295e6256322dfbb9e43b25bafb59ff4fb123ac59ea"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v5.4.1/caffeine-5.4.1-macos-arm64.tar.gz"
    sha256 "7952b88abc3e0986b5c53886b222accca63db7efb1ed30f1e0ced2a3f15d364a"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v5.4.1/caffeine-5.4.1-linux-x64.tar.gz"
    sha256 "ee9dedeab32c4b0847cb193108a7d4e4017a5ce8fb31eb4bc636a2c8336cc8f6"
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
