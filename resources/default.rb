actions :create, :delete

attribute :name,          :kind_of => String, :name_attribute => true
attribute :cpu,           :kind_of => String, :default => 'unlimited'
attribute :memory,        :kind_of => String, :default => 'unlimited'
attribute :network_read,  :kind_of => String, :default => 'unlimited'
attribute :network_write, :kind_of => String, :default => 'unlimited'
attribute :storage_read,  :kind_of => String, :default => 'unlimited'
attribute :storage_write, :kind_of => String, :default => 'unlimited'

# Machine bound and container allocation modifiers
#  --cl,  --cpu-limit <N>            Specify cpu
#  --ml,  --memory-limit <N>         Specify memory
#  --nrl, --network-read-limit <N>   Specify network read bandwidth
#  --nwl, --network-write-limit <N>  Specify network write bandwidth
#  --srl, --storage-read-limit <N>   Specify storage read bandwidth
#  --swl, --storage-write-limit <N>  Specify storage write bandwidth
#         --absolute-limits          Treat container limits for all specifed axes
#                                      as absolute, not relative
#         --fixed-limits <all|cpu,mem,net_rbw,net_wbw,io_rbw,io_wbw>
#                                      Specify axes for static container limits

# Possible values for machine bounds and container allocation <N> include:
#  <number>      Limit for machine bounds (G=giga, M=mega, K=kilo)
#                For container with --absolute-limits, container limits
#                Without --absolute-limits, limit is relative to machine bounds
#  u, unlimited  Special code for unlimited machine bounds or container allocation
#  m, monitor    Special code for monitor container limits
#  f, fair       Special code for fair-share container limits

