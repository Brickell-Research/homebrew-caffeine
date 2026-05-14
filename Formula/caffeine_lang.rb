class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "5.5.0"

  # Platform-specific downloads — binaries hosted on the caffeine repo
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v5.5.0/caffeine-5.5.0-macos-x64.tar.gz"
    sha256 "9d64cbb7ba0814932e5e5170a89aa06a7f658edadfad5aee6d5ddc429af95340"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v5.5.0/caffeine-5.5.0-macos-arm64.tar.gz"
    sha256 "55596f8d5c304dabd4170d15054297f839c853b2ed80723505bef5711ea1757b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v5.5.0/caffeine-5.5.0-linux-x64.tar.gz"
    sha256 "b7bfdade7596836e1d4ecda1000a4544db5ac70d3ea5d9cb471ca775ef5427f7"
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
