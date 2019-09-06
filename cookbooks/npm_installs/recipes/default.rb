include_recipe 'nodejs::default'

directory "#{node['camsa']['dirs']['working']}/statsd/azure-queue" do
  recursive true
end

# See https://github.com/redguide/nodejs/issues/172
apt_package 'npm'

# Install the specified npm packages
node['camsa']['chefserver']['npm']['packages'].each do |package|
  npm_package package['name'] do
    version package['version'] if package.include?('version')
    options package['options'] if package.include?('options')
    path package['path'] if package.include?('path')
  end
end
