class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "4.0.2"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.0.2/caffeine-4.0.2-macos-x64.tar.gz"
    sha256 "415a42f319c12fccb86a2b2773b424fdf429898549bcb89ccef26a3491200351"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.0.2/caffeine-4.0.2-macos-arm64.tar.gz"
    sha256 "70ebd8efe146f47a6b0a929af8c932fa00baf20a020879832f83d62256c22671"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.0.2/caffeine-4.0.2-linux-x64.tar.gz"
    sha256 "f8d570211bca5994dd25f6f78721bcf67837cda8ae65b9853be84e2f1c0bbcbe"
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
