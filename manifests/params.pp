# == Class: fedoragsearch
#
# Parameters for the fedoragsearch Class
#
class fedoragsearch::params {

  $fedoragsearch::download_url = 'http://downloads.sourceforge.net/fedora-commons/fedoragsearch-2.7.zip'
  $fedoragsearch::version = '2.7'

  $fedoragsearch::fedora_user_name = 'fgsAdmin'
  $fedoragsearch::fedora_user_pass = 'secret'
  $fedoragsearch::fedora_admin_user_name = 'fedoraAdmin'
  $fedoragsearch::fedora_admin_user_pass = 'secret'
  $fedoragsearch::fedora_repo_name = 'fgsAdmin'
  $fedoragsearch::fedora_version = '3.8.0'
  $fedoragsearch::fedora_home = '/usr/local/fedora'
  $fedoragsearch::fedora_users = "${fedoragsearch::fedora_home}/server/config/fedora-users.xml"

  $fedoragsearch::servlet_engine = 'tomcat'
  $fedoragsearch::servlet_webapps_dir_path = '/var/lib/tomcat/webapps'
  $fedoragsearch::servlet_context_dir_path = '/etc/tomcat/Catalina/localhost'
  $fedoragsearch::servlet_host = 'localhost'
  $fedoragsearch::servlet_port = '8080'

  $fedoragsearch::solr_version = '4.2.0'
  $fedoragsearch::install_dir_path = '/usr/share/solr'
  $fedoragsearch::solr_index_name = 'fedora'
}
