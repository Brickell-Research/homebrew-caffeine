class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "4.3.1"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.3.1/caffeine-4.3.1-macos-x64.tar.gz"
    sha256 "bad7d2af9d38d6b5f00a23838c422cd2cf8298516c6871368b4a5c0288b10766"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.3.1/caffeine-4.3.1-macos-arm64.tar.gz"
    sha256 "63ddf3de279d0f0978c6046936732a9261c4fcd52f6c40d985f486a8a6dd9bd3"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.3.1/caffeine-4.3.1-linux-x64.tar.gz"
    sha256 "450169c1878ed20ff1cc93d0c57937b5811bc92e8f01a94121596fc4d61b99b4"
  end

  def install
    # The binary name includes version and platform, rename to just "caffeine"
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
