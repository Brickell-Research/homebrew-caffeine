class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "4.0.1"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.0.1/caffeine-4.0.1-macos-x64.tar.gz"
    sha256 "55cb00120e14dc8f40714de8f666bd7b0a24828a96925dd1931c69b3ce4c8920"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.0.1/caffeine-4.0.1-macos-arm64.tar.gz"
    sha256 "d1bac18841b7eb2b89c34507ee93a614a78a15a3a176caaf837a528b7d76f91f"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.0.1/caffeine-4.0.1-linux-x64.tar.gz"
    sha256 "90bba6a9d9915650a5eca7d82e580a69860025590f60da3300fdfb23943419e4"
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
