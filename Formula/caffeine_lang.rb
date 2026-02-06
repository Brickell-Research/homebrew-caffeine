class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "4.2.2"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.2.2/caffeine-4.2.2-macos-x64.tar.gz"
    sha256 "f505448b3c5910a1fdbf61a5ef20e21bc9c1ad96b46f56392c470e08d27a29bc"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.2.2/caffeine-4.2.2-macos-arm64.tar.gz"
    sha256 "1b698dee618aad8a092d1be1eb62ec0e4bd6c1b376abfc834171ff9e1a965975"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.2.2/caffeine-4.2.2-linux-x64.tar.gz"
    sha256 "8f9ea9808ba869f2fe306bbc353bf0238f1555df0f34aba897e22635e9f0ed91"
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
