maintainer        "Librato, Inc."
maintainer_email  "info@librato.com"
license           "Apache 2.0"
description       "Installs/Configures Librato Silverline"
version           "0.0.1"

depends 'apt', '~> 1.1.1'

%w{ubuntu}.each do |os|
  supports os
end
