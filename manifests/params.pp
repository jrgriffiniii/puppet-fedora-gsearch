# == Class: fedoragsearch
#
# Parameters for the fedora_gsearch Class
#
class fedora_gsearch::params {

  $fedora_gsearch::download_url = 'http://downloads.sourceforge.net/fedora-commons/fedoragsearch-2.7.zip'
  $fedora_gsearch::version = '2.7'

  $fedora_gsearch::fedora_user_name = 'fgsAdmin'
  $fedora_gsearch::fedora_user_pass = 'secret'
  $fedora_gsearch::fedora_admin_user_name = 'fedoraAdmin'
  $fedora_gsearch::fedora_admin_user_pass = 'secret'
  $fedora_gsearch::fedora_repo_name = 'fgsAdmin'
  $fedora_gsearch::fedora_version = '3.8.0'
  $fedora_gsearch::fedora_home = '/usr/local/fedora'
  $fedora_gsearch::fedora_users = "${fedora_gsearch::fedora_home}/server/config/fedora-users.xml"

  $fedora_gsearch::servlet_engine = 'tomcat'
  $fedora_gsearch::servlet_webapps_dir_path = '/var/lib/tomcat/webapps'
  $fedora_gsearch::servlet_context_dir_path = '/etc/tomcat/Catalina/localhost'
  $fedora_gsearch::servlet_host = 'localhost'
  $fedora_gsearch::servlet_port = '8080'

  $fedora_gsearch::solr_version = '4.2.0'
  $fedora_gsearch::install_dir_path = '/usr/share/solr'
  $fedora_gsearch::solr_index_name = 'fedora'
}
