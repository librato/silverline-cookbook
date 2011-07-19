action :create do
  execute "create container" do
    command "lmc --ac #{new_resource.name} --cl #{new_resource.cpu} --ml #{new_resource.memory} --nrl #{new_resource.network_read} --nwl #{new_resource.network_write} --srl #{new_resource.storage_read} --swl #{new_resource.storage_write}"
    action :run
  end
end

action :delete do
  execute "delete container" do
    command "lmc --rc #{new_resource.name}"
    only_if "lmc --sc | grep #{new_resource.name}"
    action :run
  end
end
