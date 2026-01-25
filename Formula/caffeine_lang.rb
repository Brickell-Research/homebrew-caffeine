class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "3.0.15"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v3.0.15/caffeine-3.0.15-macos-x64.tar.gz"
    sha256 "068a2d57ec30dce8e937013a39cd4c6e1534eae36e529792e3353ea13c53a8e7"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v3.0.15/caffeine-3.0.15-macos-arm64.tar.gz"
    sha256 "7e771c25422bb34b8ca02f0875b7b8be70e7a9def2967eb76ccd4906b17c1b07"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v3.0.15/caffeine-3.0.15-linux-x64.tar.gz"
    sha256 "094c9453680ae450ed0a61253b2336686a473b02a13095bd643f875769a039f7"
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
