#
# Configure silverline for particular service init types
#

# Silverline a runit service. This relies on the use of the
# chpst -e option pointing to (by default) the path:
#   <runit_service_dir>/<service>/env
# The directory can be overriden with the `envdir` option.
#
# Use:
#
#  silverline_runit_service "myservice" do
#    options :name => "FOONAME",
#            :container => "container_name"
#            :tags => "extra:tags"
#  end
#
#  By default, the service name is used as the Silverline name.
#
define :silverline_runit_service, :options => {}, :envdir => nil do
  include_recipe "runit"

  options = params[:options]
  vars = {
    "SL_NAME" => options[:name] || params[:name],
    "SL_CONTAINER_NAME" => options[:container],
    "SL_TAG_NAMES" => options[:tags]
  }

  envdir = params[:envdir]
  envdir ||= "#{node[:runit][:service_dir]}/#{params[:name]}/env"

  directory envdir do
    recursive true
  end

  vars.each_pair do |k, v|
    next unless v

    file "#{envdir}/#{k}" do
      owner "root"
      mode "0644"
      content v
      action :create
      notifies :restart, resources(:service => params[:name])
    end
  end
end
