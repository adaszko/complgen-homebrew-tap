class Complgen < Formula
  version "0.1.6"
  desc "complgen"
  homepage "https://github.com/adaszko/complgen"
  url "https://github.com/adaszko/complgen/archive/v#{version}.tar.gz"
  sha256 "c8dda7849aca440a8383ee349738e3f9e3513099dda6a56a31828bf313019a8a"

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
