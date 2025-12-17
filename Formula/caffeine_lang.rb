class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "1.0.2"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v1.0.2/caffeine-1.0.2-macos-x64.tar.gz"
    sha256 "03403d30237a3ea76d58d5a32829793450815fea1f3f735961c82ea0c4a44785"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v1.0.2/caffeine-1.0.2-macos-arm64.tar.gz"
    sha256 "234b383bea228d5a2396cc07c5e46fec3e135ef4a8f58bdd8142964c1d7587ef"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v1.0.2/caffeine-1.0.2-linux-x64.tar.gz"
    sha256 "249c22ca1db2cb91f7061b7133a8f72cbd2e57533a0d29138c316ea111e53592"
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
