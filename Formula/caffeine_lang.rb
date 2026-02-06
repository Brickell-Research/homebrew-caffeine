class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "4.2.1"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.2.1/caffeine-4.2.1-macos-x64.tar.gz"
    sha256 "5dab70e48cedd7ff94bfe8533dd58c6520df961c817bea986311e0e1116ae48b"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.2.1/caffeine-4.2.1-macos-arm64.tar.gz"
    sha256 "37b122e19989eca9a6aa9ab18dd36b3e868348473f4235b62cf9a8d477ea7982"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.2.1/caffeine-4.2.1-linux-x64.tar.gz"
    sha256 "484c034934d6fba72a2ed12ed4ddc5b2df91f30d7b98622e44e57fc24953b575"
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
