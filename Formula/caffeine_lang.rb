class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "2.0.2"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v2.0.2/caffeine-2.0.2-macos-x64.tar.gz"
    sha256 "2a5dc6f02a64a4853c2acc13840b608b3276d90b18dacb0efb02ab83fb8031bf"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v2.0.2/caffeine-2.0.2-macos-arm64.tar.gz"
    sha256 "847c39bbc2ad63730e8652a113d2e50f84e2b1bb45265743c0808b6f9e4193a5"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v2.0.2/caffeine-2.0.2-linux-x64.tar.gz"
    sha256 "123c8103d6f55b806dc077c86e61f36de78085a302543846a52f7fba07051a88"
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
