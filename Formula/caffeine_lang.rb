class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "4.10.0"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.10.0/caffeine-4.10.0-macos-x64.tar.gz"
    sha256 "78310d8c25dc5bed16cd377ac6fc213378df1ec5dd74a2c020531fe9b7a12b2b"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.10.0/caffeine-4.10.0-macos-arm64.tar.gz"
    sha256 "1f64bf5fd56e6786b23143c74d1bfd4e314a7814e10ad0d347e27929bea8f98b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.10.0/caffeine-4.10.0-linux-x64.tar.gz"
    sha256 "0e76fb176087d61c2386d9956939e9eea342db6da1823a30d27eec960a862393"
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
