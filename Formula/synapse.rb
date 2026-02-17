class Synapse < Formula
  desc "Ambient intelligence for your desktop"
  homepage "https://github.com/serrrfirat/homebrew-synapse"
  version "0.1.6"
  license "MIT"

  depends_on "screenpipe"

  on_macos do
    on_arm do
      url "https://github.com/serrrfirat/homebrew-synapse/releases/download/v#{version}/synapse-#{version}-darwin-arm64.tar.gz"
      sha256 "03f1605c428bebc1a39874e8e2bab3bafd30b4f18a2218e4d28210b9a933fab2"
    end

    on_intel do
      url "https://github.com/serrrfirat/homebrew-synapse/releases/download/v#{version}/synapse-#{version}-darwin-x64.tar.gz"
      sha256 "91e622871bb7a81ded5e8289ce46afc1989a032370eeb43d12c1a0e647b7b832"
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
