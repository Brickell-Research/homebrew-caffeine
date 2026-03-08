class CaffeineLang < Formula
  desc "Caffeine programming language"
  homepage "https://caffeine-lang.run"
  license "GPL-3.0-only"
  version "4.6.7"

  # Platform-specific downloads
  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.6.7/caffeine-4.6.7-macos-x64.tar.gz"
    sha256 "afd0115379567beb5009cc4f8d941ce095087bf82693aacdeb75bdd008cd502d"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.6.7/caffeine-4.6.7-macos-arm64.tar.gz"
    sha256 "e5181c314f3098135eb0804d2357ff7e5aed5bcd774c72963262769ed668de4b"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_lang/releases/download/v4.6.7/caffeine-4.6.7-linux-x64.tar.gz"
    sha256 "de27f60996a0877a559c3f0fa1255f5c0aec5e13037ad6e3d3ab5ad9874a971f"
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
