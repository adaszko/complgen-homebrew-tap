class Complgen < Formula
  version "0.1.8"
  desc "complgen"
  homepage "https://github.com/adaszko/complgen"
  url "https://github.com/adaszko/complgen/archive/v#{version}.tar.gz"
  sha256 "1f30f6ff09f188bd186129c09873a554b6ee635aaeaab84bd3827c7a9c2aaecb"

  depends_on "rust" => :build
  depends_on "bash-completion"

  def install
    system "cargo", "install", "--no-track", "--root", prefix, "--path", "."
    system "cargo", "run", "--release", "--", "aot", "--bash-script", "complgen.bash", "--fish-script", "complgen.fish", "--zsh-script", "complgen.zsh", "usage/complgen.usage"
    bash_completion.install "complgen.bash"
    fish_completion.install "complgen.fish"
    zsh_completion.install "complgen.zsh"
  end

  test do
    system "complgen"
  end
end
