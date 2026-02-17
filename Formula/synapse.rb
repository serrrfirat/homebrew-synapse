class Synapse < Formula
  desc "Ambient intelligence for your desktop"
  homepage "https://github.com/serrrfirat/homebrew-synapse"
  version "0.1.5"
  license "MIT"

  depends_on "screenpipe"

  on_macos do
    on_arm do
      url "https://github.com/serrrfirat/homebrew-synapse/releases/download/v#{version}/synapse-#{version}-darwin-arm64.tar.gz"
      sha256 "f3c0d8b5b0ceed115bd778ac5aa94dd0818396944f255fb3879b00c734937662"
    end

    on_intel do
      url "https://github.com/serrrfirat/homebrew-synapse/releases/download/v#{version}/synapse-#{version}-darwin-x64.tar.gz"
      sha256 "7c7ce5ef3991a4ecf5488a50819ede3d9e51754a0d20d81b0a44f1517684fcd7"
    end
  end

  def install
    bin.install "bin/synapse"
    bin.install "bin/synapse-daemon"
    (share/"synapse/prompts").install Dir["share/synapse/prompts/*"]
    (share/"synapse/openclaw").install Dir["share/synapse/openclaw/*"]
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/synapse --version")
  end
end
