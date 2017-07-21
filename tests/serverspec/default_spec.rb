require "spec_helper"
require "serverspec"

package = "tmux"
additional_packages = ["sysutils/py-tmuxp"]

describe package(package) do
  it { should be_installed }
end

describe command("tmux -V") do
  its(:exit_status) { should eq 0 }
  its(:stdout) { should match(/^tmux\s/) }
  its(:stderr) { should eq "" }
end

additional_packages.each do |p|
  describe package(p) do
    it { should be_installed }
  end
end
