class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "4.1.0"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.1.0/caffeine-4.1.0-macos-x64.tar.gz"
    sha256 "e013f8c3ae5b916139063aba7ea310af58628ea44346ce4cc566753866b68054"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.1.0/caffeine-4.1.0-macos-arm64.tar.gz"
    sha256 "344cd5e1e5fa262c092dca47bd598427014def8d4c71c11b25d94ded03b4956b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.1.0/caffeine-4.1.0-linux-x64.tar.gz"
    sha256 "9b30ce14fc2415b6cbdab02b843b9a2e2657b8a301353a1d4da3abbb9db78a1c"
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
