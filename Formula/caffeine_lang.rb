class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "1.0.0"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v1.0.0/caffeine-1.0.0-macos-x64.tar.gz"
    sha256 "ea7ec98d23394cd75a4ee0c19e798cbc41dbaede4cdb9fe5e384ad268c168001"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v1.0.0/caffeine-1.0.0-macos-arm64.tar.gz"
    sha256 "f862ecd77b4dcbe71deb748a8096deaf1787b4281328ebf178d18270dcac3a4d"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v1.0.0/caffeine-1.0.0-linux-x64.tar.gz"
    sha256 "d9ba96e288529867777972270121c20e9e6786e2c8f3174a87f6904fa0ac2429"
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
