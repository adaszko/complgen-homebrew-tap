class Complgen < Formula
  version "0.1.1"
  desc "complgen"
  homepage "https://github.com/adaszko/complgen"
  url "https://github.com/adaszko/complgen/archive/v#{version}.tar.gz"
  sha256 "89c525eca38a6aafb5b1241001992e704af84f91f18c9aaf284aa29b3207e863"

  depends_on "rust" => :build
  depends_on "bash-completion"

  def install
    system "cargo", "install", "--no-track", "--root", prefix, "--path", "."
  end

  test do
    system "complgen"
  end
end
