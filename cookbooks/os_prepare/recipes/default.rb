#
# prepare all operating systems with the required configuration

apt_update if platform_family?("debian")

# inject the current inspec gem for use with audit cookbook
# this is generated via Rake test:integration
# cookbook_file "/root/inspec-core-local.gem" do
#   source "inspec-core-local.gem"
#   action :create
# end

remote_file "/tmp/inspec_4.deb" do
  source "https://packages.chef.io/files/stable/inspec/4.16.0/ubuntu/18.04/inspec_4.16.0-1_amd64.deb"
  notifies :install, 'dpkg_package[inspec]'
end

dpkg_package "inspec" do
  source "/tmp/inspec_4.deb"
  action :nothing
end

def uuid_from_string(string)
  require "digest/sha1"
  hash = Digest::SHA1.new
  hash.update(string)
  ary = hash.digest.unpack("NnnnnN")
  ary[2] = (ary[2] & 0x0FFF) | (5 << 12)
  ary[3] = (ary[3] & 0x3FFF) | 0x8000
  "%08x-%04x-%04x-%04x-%04x%08x" % ary
end

# set a static node uuid for our testing nodes
Chef::Config[:chef_guid] = uuid_from_string(node.name)

# confgure ssh
include_recipe("os_prepare::ssh")
