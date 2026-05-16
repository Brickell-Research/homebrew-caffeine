class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "6.0.0"

  # Platform-specific downloads — binaries hosted on the caffeine repo
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v6.0.0/caffeine-6.0.0-macos-x64.tar.gz"
    sha256 "10341a29dd3b245efd05f74620943fbdd17c76b0d9089547009992a165e5b14a"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v6.0.0/caffeine-6.0.0-macos-arm64.tar.gz"
    sha256 "62fdcaa18343dfb7573b45337e73571bfccb1106b5c21b4266f62b9ce2ac400a"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine/releases/download/v6.0.0/caffeine-6.0.0-linux-x64.tar.gz"
    sha256 "41dd55685e89385da16288c506a1e9d03ef426dbca3e56595fda23d90cfcc096"
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
