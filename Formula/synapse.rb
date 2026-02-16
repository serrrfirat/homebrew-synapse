class Synapse < Formula
  desc "Ambient intelligence for your desktop"
  homepage "https://github.com/serrrfirat/homebrew-synapse"
  version "0.1.0"
  license "MIT"

  depends_on "screenpipe"

  on_macos do
    on_arm do
      url "https://github.com/serrrfirat/homebrew-synapse/releases/download/v#{version}/synapse-#{version}-darwin-arm64.tar.gz"
      sha256 "6b1b0a85e3873677897d7a96da678f8f957e43cfb561dacd1b4fbb8a14de8835"
    end

    on_intel do
      url "https://github.com/serrrfirat/homebrew-synapse/releases/download/v#{version}/synapse-#{version}-darwin-x64.tar.gz"
      sha256 "26f63d93a4852c1db205ed5d069c795a979b2c38237c15cfe71905efc9a37dd8"
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
