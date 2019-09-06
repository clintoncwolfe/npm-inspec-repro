control "NPM packages should be installed" do
  # Check necessary NPM packages are installed
  describe npm('statsd') do
    it { should be_installed }
  end

  describe npm('azure-storage', path: '/usr/local/camsa/statsd/azure-queue') do
    it { should be_installed }
  end

  describe npm('sprintf-js', path: '/usr/local/camsa/statsd/azure-queue') do
    it { should be_installed }
  end
end
