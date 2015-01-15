# == Class: fedoragsearch::install
#
# Class for managing the installation process of Fedora Generic Search
#
class fedoragsearch::install inherits fedoragsearch {

  package { 'ant':

    ensure => 'installed'
  }

  require(['::java', 'epel', '::tomcat'])
   
  exec { 'fedoragsearch_download':
    
    command => "/usr/bin/env wget ${fedoragsearch::download_url} -O /tmp/fedoragsearch.zip",
    unless => '/usr/bin/env stat /tmp/fedoragsearch.zip'
  }

  exec { 'fedoragsearch_decompress':

    command => "/usr/bin/env unzip /tmp/fedoragsearch.zip fedoragsearch-2.7/fedoragsearch.war -d /tmp",
    require => Exec['fedoragsearch_download']
  }

  exec { 'fedoragsearch_deploy':

    command => "/usr/bin/env cp /tmp/fedoragsearch-2.7/fedoragsearch.war ${fedoragsearch::servlet_webapps_dir_path}",
    require => Exec['fedoragsearch_decompress']
  }
  
  file_line { 'fedoragsearch_fedora_add_user':

    path => "${fedoragsearch::fedora_home}/server/config/fedora-users.xml",
    line => template('fedoragsearch/fedora-users.xml.erb')
  }

  exec { 'fedoragsearch_insert_properties':
    
    command => "/usr/bin/env sed -i 's#property file=\"fgsconfig-basic.properties#property file=\"fgsconfig-basic-for-islandora.properties#' ${fedoragsearch::servlet_webapps_dir_path}/fedoragsearch/FgsConfig/fgsconfig-basic.xml",
    unless => "/usr/bin/env grep -q 'for-islandora' ${fedoragsearch::servlet_webapps_dir_path}/fedoragsearch/FgsConfig/fgsconfig-basic.xml",
    require => Exec['fedoragsearch_deploy']
  }

  exec { 'fedoragsearch_ant_build':
    
    command => "/usr/bin/env ant -f ${fedoragsearch_build}",
    unless => "/usr/bin/env stat ${fedoragsearch_schema}",
    require => Package['ant']
  }

  exec { 'fedoragsearch_solr_schema_deploy':

    command => "/usr/bin/env cp ${fedoragsearch::servlet_webapps_dir_path}/fedoragsearch/WEB-INF/classes/fgsconfigFinal/index/FgsIndex/conf/schema-${fedoragsearch::solr_version}-for-fgs-${fedoragsearch::version}.xml ${fedoragsearch::install_dir_path}/${fedoragsearch::solr_index_name}/conf/schema.xml",
    require => Exec['fedoragsearch_ant_build']
  }
}
