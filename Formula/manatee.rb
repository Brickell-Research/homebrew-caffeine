class Manatee < Formula
  desc "Self adapting agent harness"
  homepage "https://github.com/Brickell-Research/manatee"
  version "0.1.0"
  url "https://github.com/Brickell-Research/manatee/releases/download/v0.1.0/manatee-0.1.0.tar.gz"
  sha256 "6b3b4bd1eed498faf6b0438e76921563811a9f301d95a00037b20e0990be8ebb"

  depends_on "erlang"

  def install
    libexec.install Dir["*"]
    (bin/"manatee").write <<~SCRIPT
      #!/bin/bash
      export PATH="#{Formula["erlang"].opt_bin}:$PATH"
      exec "#{libexec}/entrypoint.sh" run "$@"
    SCRIPT
  end

  test do
    assert_match "manatee", shell_output("#{bin}/manatee < /dev/null")
  end
end
