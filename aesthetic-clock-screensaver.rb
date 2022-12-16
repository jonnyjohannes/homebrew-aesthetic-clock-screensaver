# Documentation: https://docs.brew.sh/Formula-Cookbook
#                https://rubydoc.brew.sh/Formula
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class AestheticClockScreensaver < Formula
  desc "Aesthetic Clock Screensaver"
  homepage "https://github.com/jonnyjohannes/AestheticClock"
  url "https://github.com/jonnyjohannes/AestheticClock/archive/refs/tags/v0.0.1-alpha.tar.gz"
  sha256 "a0951e2ab12ed20127a83d1c03d5d911b76160bc515f9c3ba858d001f3df944d"
  license "mit"

  # depends_on "cmake" => :build

  def install
    # ENV.deparallelize  # if your formula fails when building in parallel
    # Remove unrecognized options if warned by configure
    # https://rubydoc.brew.sh/Formula.html#std_configure_args-instance_method
    # system "cmake", "-S", ".", "-B", "build", *std_cmake_args
    screen_saver 'AestheticClock.saver'
  end

  test do
    # `test do` will create, run in and delete a temporary directory.
    #
    # This test will fail and we won't accept that! For Homebrew/homebrew-core
    # this will need to be a test that verifies the functionality of the
    # software. Run the test with `brew test AestheticClock`. Options passed
    # to `brew install` such as `--HEAD` also need to be provided to `brew test`.
    #
    # The installed folder is not in the path, so use the entire path to any
    # executables being tested: `system "#{bin}/program", "do", "something"`.
    system "false"
  end
end
