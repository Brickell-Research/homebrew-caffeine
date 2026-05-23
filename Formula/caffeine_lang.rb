class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "6.1.2"

  # Platform-specific downloads — binaries hosted on the caffeine repo
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v6.1.2/caffeine-6.1.2-macos-x64.tar.gz"
    sha256 "9643152c9185c3f620edf77175288d360279ffce4e13002ad2ea04dd80ddbcb8"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v6.1.2/caffeine-6.1.2-macos-arm64.tar.gz"
    sha256 "b17a02a1f50dbff94c00d0ded9888caa7f8de670ea3bc2627972a84334f8942c"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v6.1.2/caffeine-6.1.2-linux-x64.tar.gz"
    sha256 "f7439547f295e2b31299cf40c8fa945d1b3efae9a862f1d83039a6c4006c77c6"
  end

  def install
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
