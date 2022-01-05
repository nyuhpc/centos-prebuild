# copyright: 2018, The Authors

title "sample section"

# you can also use plain tests
describe file("/tmp") do
  it { should be_directory }
end

# you add controls here
control "os-01" do                        # A unique ID for this control
  impact 0.9                                # The criticality, if this control fails.
  title "Check the release file"             # A human-readable title
  desc "An optional description..."
  describe file("/etc/redhat-release") do                  # The actual test
    it { should exist }
    it { should be_symlink }
    it { should be_owned_by 'root' }
    its('group') { should eq 'root' }
    it { should be_readable.by('owner') }
    it { should be_readable.by('group') }
    it { should be_readable.by('other') }
    its('content') { should match( 'CentOS Linux release 8.5.2111')}
  end
end
