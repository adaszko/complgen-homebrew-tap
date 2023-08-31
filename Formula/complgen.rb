class Complgen < Formula
  version "0.0.1"
  desc "complgen"
  homepage "https://github.com/adaszko/complgen"

  url "https://github.com/adaszko/complgen/releases/download/v#{version}/complgen-.tar.gz"
  sha256 "???"

  depends_on "bash-completion"

  def install
    bin.install "complgen"
  end

  test do
    system "complgen"
  end
end
