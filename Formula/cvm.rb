class Cvm < Formula
  desc "Caffeine Version Manager"
  homepage "https://github.com/Brickell-Research/caffeine_vm"
  license "MIT"
  version "1.0.1"

  if OS.mac? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_vm/releases/download/v1.0.1/cvm-1.0.1-macos-x64.tar.gz"
    sha256 "323163a8001a9a7e32e8fbdc459310d25fa69817dbd5f08c47f4a71c67eb9f44"
  elsif OS.mac? && Hardware::CPU.arm?
    url "https://github.com/Brickell-Research/caffeine_vm/releases/download/v1.0.1/cvm-1.0.1-macos-arm64.tar.gz"
    sha256 "7a00518a67276500d2318d00c121512c0a95ef80d4240406b48ca42d884d78f3"
  elsif OS.linux? && Hardware::CPU.intel?
    url "https://github.com/Brickell-Research/caffeine_vm/releases/download/v1.0.1/cvm-1.0.1-linux-x64.tar.gz"
    sha256 "335b671fa2559cd1112b6f208427accbee0674551714b34b3a496bbcefa18f67"
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

  def caveats
    <<~EOS
      To use caffeine versions managed by cvm, add this to your shell config:

export PATH="/home/runner/.cvm/current:/home/runner/.bun/bin:/home/runner/work/_temp/.setup-beam/gleam/bin:/home/runner/work/_temp/.setup-beam/otp/bin:/snap/bin:/home/runner/.local/bin:/opt/pipx_bin:/home/runner/.cargo/bin:/home/runner/.config/composer/vendor/bin:/usr/local/.ghcup/bin:/home/runner/.dotnet/tools:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin"

      Then run: cvm install latest
    EOS
  end

  test do
    assert_match "Caffeine Version Manager", shell_output("#{bin}/cvm help")
  end
end
