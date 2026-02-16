class Synapse < Formula
  desc "Ambient intelligence for your desktop"
  homepage "https://github.com/serrrfirat/homebrew-synapse"
  version "0.1.3"
  license "MIT"

  depends_on "screenpipe"

  on_macos do
    on_arm do
      url "https://github.com/serrrfirat/homebrew-synapse/releases/download/v#{version}/synapse-#{version}-darwin-arm64.tar.gz"
      sha256 "90ff5edcbe3bd2d2f366edfb8bd793a4ee4526a915cfdf5469dfeb6ddec5b73d"
    end

    on_intel do
      url "https://github.com/serrrfirat/homebrew-synapse/releases/download/v#{version}/synapse-#{version}-darwin-x64.tar.gz"
      sha256 "9640ee0c1595f6ac0353cfecf111398819e6092e1e026da3031b384593bbff0f"
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
