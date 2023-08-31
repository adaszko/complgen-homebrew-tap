class Complgen < Formula
  version "0.1.0"
  desc "complgen"
  homepage "https://github.com/adaszko/complgen"
  url "https://github.com/adaszko/complgen/archive/v#{version}.tar.gz"
  sha256 "f782255e1d79a48c69ccf0772894c23bb524c40cfa3fa2c4a97484d31f0074d4"

  depends_on "rust" => :build
  depends_on "bash-completion"

  def install
    system "cargo", "install", "--no-track", "--root", prefix, "--path", "."
  end

  test do
    system "complgen"
  end
end
