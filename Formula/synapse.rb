class Synapse < Formula
  desc "Ambient intelligence for your desktop"
  homepage "https://github.com/serrrfirat/homebrew-synapse"
  version "0.1.4"
  license "MIT"

  depends_on "screenpipe"

  on_macos do
    on_arm do
      url "https://github.com/serrrfirat/homebrew-synapse/releases/download/v#{version}/synapse-#{version}-darwin-arm64.tar.gz"
      sha256 "6f07b19a123ba79834c1b85322c86cdae2d4c9079f04d09d42f95e06e9b1e3e9"
    end

    on_intel do
      url "https://github.com/serrrfirat/homebrew-synapse/releases/download/v#{version}/synapse-#{version}-darwin-x64.tar.gz"
      sha256 "30115e0756e64a8701f0f5f04e0a766c1abae9794edddcf87bdae58acc5783d0"
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
