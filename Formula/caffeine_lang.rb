class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "6.2.1"

  # Platform-specific downloads — binaries hosted on the caffeine repo
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v6.2.1/caffeine-6.2.1-macos-x64.tar.gz"
    sha256 "40ee748f71fa2e89af7f832a0f94ef876d6d3c9a4a13701d3bb0d6c662ec4eef"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v6.2.1/caffeine-6.2.1-macos-arm64.tar.gz"
    sha256 "a4d42758308d8704bd81fc4e7922abaebae6792689570dc1f93f77547b247404"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v6.2.1/caffeine-6.2.1-linux-x64.tar.gz"
    sha256 "4c5f7327d0066385d147a0b274dca4635dca8683482645e1d5214337149f80cb"
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
