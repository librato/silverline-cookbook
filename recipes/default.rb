include_recipe 'apt'

cookbook_file '/etc/update-motd.d/50-landscape-sysinfo' do
  owner 'root'
  group 'root'
  mode '755'
end

apt_repository "librato" do
  uri "http://apt.librato.com/ubuntu"
  distribution node['lsb']['codename']
  components ["non-free"]
  key "http://apt.librato.com/packages.librato.key"
  notifies :run, "execute[apt-get update]", :immediately
  action :add
end

apt_package "librato-silverline" do
  action :install
end

template "/etc/load_manager/lmd.conf" do
  source 'lmd.conf.erb'
  owner 'root'
  group 'root'
  mode '600'
  variables({
              :api_token => node[:silverline][:api_token],
              :server_id_cmd => node[:silverline][:server_id_cmd],
              :template_id => node[:silverline][:template_id]
            })
  action :create
end

template "/etc/load_manager/lmc.conf" do
  source 'lmd.conf.erb'
  owner 'root'
  group 'root'
  mode '0600'
  variables :email => node[:silverline][:email_address]
  action :create
end

service 'silverline' do
  provider Chef::Provider::Service::Upstart
  action [:enable, :start]
end
