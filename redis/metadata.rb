maintainer        "Kevin McCarthy"
maintainer_email  "me@kevinmccarthy.org"
description       "Installs and configures redis server"
version           "0.3"
recipe            "redis", "Install and configure redis"

%w{ubuntu debian redhat centos}.each do |os|
  supports os
end

attribute "redis",
  :display_name => "redis",
  :description => "Hash of redis attributes",
  :type => "hash"

attribute "redis/databases",
  :display_name => "Number of redis databases",
  :description => "The number of redis datbases. The default is 16, the max is infinite, but you should keep it below 1024",
  :default => "16"
