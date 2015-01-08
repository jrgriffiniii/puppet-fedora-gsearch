# == Class: fedoragsearch
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
class fedoragsearch (

  $fedoragsearch::download_url = params_lookup( 'download_url' ),
  $fedoragsearch::version = params_lookup( 'version' ),

  $fedoragsearch::fedora_user_name = params_lookup( 'fedora_user_name' ),
  $fedoragsearch::fedora_user_pass = params_lookup( 'fedora_user_pass' ),
  $fedoragsearch::fedora_admin_user_name = params_lookup( 'fedora_admin_user_name' ),
  $fedoragsearch::fedora_admin_user_pass = params_lookup( 'fedora_admin_user_pass' ),
  $fedoragsearch::fedora_repo_name = params_lookup( 'fedora_repo_name' ),
  $fedoragsearch::fedora_version = params_lookup( 'fedora_version' ),
  $fedoragsearch::fedora_home = params_lookup( 'fedora_home' ),

  $fedoragsearch::servlet_engine = params_lookup( 'servlet_engine' ),
  $fedoragsearch::servlet_webapps_dir_path = params_lookup( 'servlet_webapps_dir_path' ),
  $fedoragsearch::servlet_context_dir_path = params_lookup( 'servlet_context_dir_path' ),
  $fedoragsearch::servlet_host = params_lookup( 'servlet_host' ),
  $fedoragsearch::servlet_port = params_lookup( 'servlet_port' ),

  $fedoragsearch::solr_version = params_lookup( 'solr_version' ),
  $fedoragsearch::install_dir_path = params_lookup( 'install_dir_path' ),
  $fedoragsearch::solr_index_name = params_lookup( 'solr_index_name' )
  
  ) inherits fedoragsearch::params {

    # @todo Implement support for Jetty

    # Install the service
    require fedoragsearch::install
  }
