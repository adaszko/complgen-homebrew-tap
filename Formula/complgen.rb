class Complgen < Formula
  version "0.1.5"
  desc "complgen"
  homepage "https://github.com/adaszko/complgen"
  url "https://github.com/adaszko/complgen/archive/v#{version}.tar.gz"
  sha256 "bc26815e6d118fce8f5aae42cb1ac000a0aedf3c11c5f57964c23d796637f75e"

  depends_on "rust" => :build
  depends_on "bash-completion"

  def install
    system "cargo", "install", "--no-track", "--root", prefix, "--path", "."
    system "cargo", "run", "--release", "--", "compile", "--bash-script", "complgen.bash", "--fish-script", "complgen.fish", "--zsh-script", "complgen.zsh", "usage/complgen.usage"
    bash_completion.install "complgen.bash"
    fish_completion.install "complgen.fish"
    zsh_completion.install "complgen.zsh"
  end

  test do
    system "complgen"
  end
end
