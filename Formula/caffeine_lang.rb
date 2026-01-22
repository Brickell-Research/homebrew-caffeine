class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "3.0.2"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v3.0.2/caffeine-3.0.2-macos-x64.tar.gz"
    sha256 "7270a2c56e00e63b5fcf5e0fad32435f792c311c2bba46e5d06f1cfdb7d3cc2a"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v3.0.2/caffeine-3.0.2-macos-arm64.tar.gz"
    sha256 "6814a37d3e55067b202fadcdc1c37d59f4a8e8d7eb34cf310c203c4466085cd5"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v3.0.2/caffeine-3.0.2-linux-x64.tar.gz"
    sha256 "300d50440725a8fbd1c65da21552f3be4791292690f2ad5b5f2fdda2c45eb27e"
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
