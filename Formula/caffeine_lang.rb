class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "4.0.13"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.0.13/caffeine-4.0.13-macos-x64.tar.gz"
    sha256 "870a0ffa628a38615118f2f6cf3a9d1c0c24b463e75f6be85fd3822d36e5b488"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.0.13/caffeine-4.0.13-macos-arm64.tar.gz"
    sha256 "fecfa1a3a82fc8d3f4f61c38dfa97438913591863738eba68237d10e6c94242f"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.0.13/caffeine-4.0.13-linux-x64.tar.gz"
    sha256 "be46c37027c7018d2a429bca928e5066c5d11eefdece91ede71a5e5c3fd7979c"
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
