class AiStatusBar < Formula
  desc "AI service usage in your macOS menu bar via SwiftBar"
  homepage "https://github.com/longbui99/AIStatusBar"
  url "https://github.com/longbui99/AIStatusBar.git", branch: "main"
  version "0.1.0"
  license "GPL-3.0-only"

  depends_on :macos
  depends_on "python@3"

  def install
    libexec.install "bin", "providers", "utils", "config.json"
    (bin/"ai-status-bar").write_env_script libexec/"bin/ai-status-bar", PATH: "#{Formula["python@3"].opt_bin}:${PATH}"
  end

  def post_install
    system libexec/"utils/setup.sh"
  end

  test do
    assert_match "ai-status-bar", shell_output("#{bin}/ai-status-bar help")
  end
end
