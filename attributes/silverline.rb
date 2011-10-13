#
# Must set API token.
# XXX: databag instead?
#
default[:silverline][:api_token] = nil

#
# Optional: Email address associated with account.
# XXX: Should also be in a databag?
#
default[:silverline][:email_address] = nil

#
# Server name command. (LM_SERVER_ID_CMD)
#
default[:silverline][:server_id_cmd] = nil

#
# Template ID
#
default[:silverline][:template_id] = nil

#
# Component
#
# Default is 'non-free', to enable the beta use 'non-free-beta'.
#
# For beta, see:
# http://support.silverline.librato.com/kb/advanced/enabling-the-31x-silverline-beta-release
#
default[:silverline][:component] = "non-free"
