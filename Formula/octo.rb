class Octo < Formula
  desc "Architecture-aware AI coding assistant"
  homepage "https://github.com/Brickell-Research/octo"
  license "MIT"

  # stable-start managed by octo release workflow
  url "https://github.com/Brickell-Research/octo/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "5ed0a53506bf07b7ce493ba3cd00814c57ad63d8ff395879d095f4003b2e73bd"
  version "0.3.0"
  # stable-end

  depends_on "ruby"

  def install
    libexec.install Dir["*"]
    env = { PATH: "#{Formula["ruby"].opt_bin}:$PATH" }
    cd libexec do
      system "bundle", "config", "set", "--local", "path", "vendor/bundle"
      system "bundle", "config", "set", "--local", "without", "development:test"
      system "bundle", "install"
    end
    (bin/"octo").write_env_script libexec/"bin/octo", env
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/octo version")
  end
end
