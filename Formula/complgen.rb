class Complgen < Formula
  version "0.1.4"
  desc "complgen"
  homepage "https://github.com/adaszko/complgen"
  url "https://github.com/adaszko/complgen/archive/v0.1.4.tar.gz"
  sha256 "9db37ff7b7baacf326dfce35d209aaa99623b0935d874c3f5ab94fa61784c2e9"

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
