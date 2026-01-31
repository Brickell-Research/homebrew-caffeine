class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "3.0.25"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v3.0.25/caffeine-3.0.25-macos-x64.tar.gz"
    sha256 "ca7df70621b4b7f6f0664420e26e3d9dea8394c7a3f7f342de9afaf6341a5bc6"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v3.0.25/caffeine-3.0.25-macos-arm64.tar.gz"
    sha256 "da5f007780e7cdfec9c49afb1f752a399d6707ff440dc1e77238172fdfc54f80"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v3.0.25/caffeine-3.0.25-linux-x64.tar.gz"
    sha256 "699ff6fea82d52ebf458461a1faf01cc7a09074dafcb1ef538259cd07d3cd48b"
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
