# == Class: fedora_gsearch
#
# This is the class for solr
#
#
# == Parameters
#
# Standard class parameters - Define solr web app specific settings
#
#
#
#
# == Examples
#
# See README
#
#
# == Author
#   James R. Griffin III <griffinj@lafayette.edu/>
#
class fedora_gsearch (

  $fedora_gsearch::download_url = params_lookup( 'download_url' ),
  $fedora_gsearch::version = params_lookup( 'version' ),

  $fedora_gsearch::fedora_user_name = params_lookup( 'fedora_user_name' ),
  $fedora_gsearch::fedora_user_pass = params_lookup( 'fedora_user_pass' ),
  $fedora_gsearch::fedora_admin_user_name = params_lookup( 'fedora_admin_user_name' ),
  $fedora_gsearch::fedora_admin_user_pass = params_lookup( 'fedora_admin_user_pass' ),
  $fedora_gsearch::fedora_repo_name = params_lookup( 'fedora_repo_name' ),
  $fedora_gsearch::fedora_version = params_lookup( 'fedora_version' ),
  $fedora_gsearch::fedora_home = params_lookup( 'fedora_home' ),

  $fedora_gsearch::servlet_engine = params_lookup( 'servlet_engine' ),
  $fedora_gsearch::servlet_webapps_dir_path = params_lookup( 'servlet_webapps_dir_path' ),
  $fedora_gsearch::servlet_context_dir_path = params_lookup( 'servlet_context_dir_path' ),
  $fedora_gsearch::servlet_host = params_lookup( 'servlet_host' ),
  $fedora_gsearch::servlet_port = params_lookup( 'servlet_port' ),

  $fedora_gsearch::solr_version = params_lookup( 'solr_version' ),
  $fedora_gsearch::install_dir_path = params_lookup( 'install_dir_path' ),
  $fedora_gsearch::solr_index_name = params_lookup( 'solr_index_name' )
  
  ) inherits fedora_gsearch::params {

    # @todo Implement support for Jetty

    # Install the service
    require fedora_gsearch::install
  }
