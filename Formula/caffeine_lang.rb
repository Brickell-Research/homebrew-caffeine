class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "5.0.8"

  # Platform-specific downloads — binaries hosted on the caffeine repo
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v5.0.8/caffeine-5.0.8-macos-x64.tar.gz"
    sha256 "a1322a154384f7bf9365a33e29889372a739a7a726891e18886dc9a2b01ecba0"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v5.0.8/caffeine-5.0.8-macos-arm64.tar.gz"
    sha256 "b3f8f3fc139520a00b8efdecf8d7671fa82245eef0624a7ac38016762863b0c2"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v5.0.8/caffeine-5.0.8-linux-x64.tar.gz"
    sha256 "766cac3de3c07b7fe60e398eecd2498f7d471d7d9faf370988ea97663cb3a2db"
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
