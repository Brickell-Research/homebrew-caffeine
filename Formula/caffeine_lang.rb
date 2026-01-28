class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "3.0.16"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v3.0.16/caffeine-3.0.16-macos-x64.tar.gz"
    sha256 "13e5c6e62f52e82a59abdd6f2bc233980cba38d894c00fbbff2c6ee756316f52"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v3.0.16/caffeine-3.0.16-macos-arm64.tar.gz"
    sha256 "890587e98f77f32139de70df3bc534f533f911b8fffe7d827368e899af8c1cc3"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v3.0.16/caffeine-3.0.16-linux-x64.tar.gz"
    sha256 "f4c04902977404163147d52b5f8e1a36730c84a5af35c39717b405050e9b0259"
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
