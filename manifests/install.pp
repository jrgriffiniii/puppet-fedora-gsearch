# == Class: fedoragsearch::install
#
# Class for managing the installation process of Fedora Generic Search
#
class fedora_gsearch::install inherits fedora_gsearch {

  package { 'ant':

    ensure => 'installed'
  }
   
  exec { 'fedoragsearch_download':
    
    command => "/usr/bin/wget ${fedoragsearch::download_url} -O /tmp/fedoragsearch.zip",
    unless => '/usr/bin/stat /tmp/fedoragsearch.zip'
  }

  exec { 'fedoragsearch_deploy':

    command => "/usr/bin/unzip /tmp/fedoragsearch.zip fedoragsearch.war -d ${fedora_gsearch::servlet_webapps_dir_path}",
    require => Exec['fedoragsearch_download']
  }
  
  file_line { 'fedoragsearch_fedora_add_user':

    path => "${fedora_gsearch::fedora_home}/server/config/fedora-users.xml",
    line => template('fedoragsearch/fedora-users.xml.erb')
  }

  exec { 'fedoragsearch_insert_properties':
    
    command => "/usr/bin/sed -i 's#property file=\"fgsconfig-basic.properties#property file=\"fgsconfig-basic-for-islandora.properties#' ${fedora_gsearch::servlet_webapps_dir_path}/fedoragsearch/FgsConfig/fgsconfig-basic.xml",
    unless => "/usr/bin/grep -q 'for-islandora' ${fedora_gsearch::servlet_webapps_dir_path}/fedoragsearch/FgsConfig/fgsconfig-basic.xml",
    require => Exec['fedoragsearch_deploy']
  }

  exec { 'fedoragsearch_ant_build':
    
    command => "/usr/bin/ant -f ${fedoragsearch_build}",
    unless => "/usr/bin/stat ${fedoragsearch_schema}",
    require => Package['ant']
  }

  exec { 'fedoragsearch_solr_schema_deploy':

    command => "/bin/cp ${fedora_gsearch::servlet_webapps_dir_path}/fedoragsearch/WEB-INF/classes/fgsconfigFinal/index/FgsIndex/conf/schema-${$fedora_gsearch::solr_version}-for-fgs-${$fedora_gsearch::version}.xml ${fedora_gsearch::install_dir_path}/${$fedora_gsearch::solr_index_name}/conf/schema.xml",
    require => Exec['fedoragsearch_ant_build']
  }
}
