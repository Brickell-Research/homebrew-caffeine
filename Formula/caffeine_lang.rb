class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "5.0.11"

  # Platform-specific downloads — binaries hosted on the caffeine repo
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v5.0.11/caffeine-5.0.11-macos-x64.tar.gz"
    sha256 "8b70ef7fd3cfdd127eb5d9406dfd77a647155552b1d7fd07adceeb458ae70d46"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v5.0.11/caffeine-5.0.11-macos-arm64.tar.gz"
    sha256 "861f8cf07c09c4eaa8d2cb05f4ecba6472d6d1f78b7f33ff73f6a5bb99cc7e00"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v5.0.11/caffeine-5.0.11-linux-x64.tar.gz"
    sha256 "603341fba1c5dfca3585a3b0aabe83e8571b552f0f4652410f836df3565df440"
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
