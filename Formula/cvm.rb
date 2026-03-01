class Cvm < Formula
  desc "Caffeine Version Manager"
  homepage "https://github.com/Brickell-Research/caffeine_vm"
  license "MIT"
  version "1.0.0"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_vm/releases/download/v1.0.0/cvm-1.0.0-macos-x64.tar.gz"
    sha256 "96fc8a916af0f449be3a1fb225b9d1d767bcfff182edb0109194ba957ec97d2b"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_vm/releases/download/v1.0.0/cvm-1.0.0-macos-arm64.tar.gz"
    sha256 "27f38ac8d3b83b23d5f9d3ce12431cbfd845c96d97336344881285536dab5f17"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_vm/releases/download/v1.0.0/cvm-1.0.0-linux-x64.tar.gz"
    sha256 "5f62d91eda258b583e010c17859c451114a801f2292d03a2c178021024d9fa10"
  end

  def install
    if OS.mac? && Hardware::CPU.intel?
      bin.install "cvm-#{version}-macos-x64" => "cvm"
    elsif OS.mac? && Hardware::CPU.arm?
      bin.install "cvm-#{version}-macos-arm64" => "cvm"
    elsif OS.linux? && Hardware::CPU.intel?
      bin.install "cvm-#{version}-linux-x64" => "cvm"
    end
  end

  test do
    assert_match "Caffeine Version Manager", shell_output("#{bin}/cvm help")
  end
end
