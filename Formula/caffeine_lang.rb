class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "5.2.0"

  # Platform-specific downloads — binaries hosted on the caffeine repo
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v5.2.0/caffeine-5.2.0-macos-x64.tar.gz"
    sha256 "a16ea00ca7dc2c01df2cd9a9b4c9ec90f05b53295a36246c109f0b422ee3dda8"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v5.2.0/caffeine-5.2.0-macos-arm64.tar.gz"
    sha256 "dac11a751e7431979139048daaf5f523f41e038c44e8de459673aae8a95593c7"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v5.2.0/caffeine-5.2.0-linux-x64.tar.gz"
    sha256 "ecb2c8f760845a3821a41f492a279b3a1c243ce5a647e8f8cb5ab07f8df94912"
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
