class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "0.2.18"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v0.2.18/caffeine-0.2.18-macos-x64.tar.gz"
    sha256 "f4a447e8edf5b0538329fbcc0607bd6e0c96e88fdab44533c1bfe066d466ce2f"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v0.2.18/caffeine-0.2.18-macos-arm64.tar.gz"
    sha256 "77b8db31d24fabd0bfbd7d3c6a74f05e81c9dd6563392c6303277301cb95673c"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v0.2.18/caffeine-0.2.18-linux-x64.tar.gz"
    sha256 "386f97776538deae1a1a6a879a22c5fcad42c03fed6eaf95857737e5795243f2"
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
