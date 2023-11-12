class Complgen < Formula
  version "0.1.7"
  desc "complgen"
  homepage "https://github.com/adaszko/complgen"
  url "https://github.com/adaszko/complgen/archive/v#{version}.tar.gz"
  sha256 "fb0d547e84e63d49e34d6f9edc8e3d495b7886a33da8e9453f77d8af7bb0d9c2"

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
