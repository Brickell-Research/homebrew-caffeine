class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "4.4.3"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.4.3/caffeine-4.4.3-macos-x64.tar.gz"
    sha256 "6c2bd65b73b95227bc2b133751dd2613f7ca8ba670cf4b3a4f9e8bf675c470a1"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.4.3/caffeine-4.4.3-macos-arm64.tar.gz"
    sha256 "26cb9f3e89877b3248436bfa33a847cc15fe3fb4bafc70f2b642fe35c037e30e"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.4.3/caffeine-4.4.3-linux-x64.tar.gz"
    sha256 "b09421fdbba65dad9bc568d7fa35e3f48350e364b6697b72f62216afc1c61bbf"
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
