
node.override['nginx']['default_site_enabled'] = false
node.override['nginx']['default']['modules'] = ['socketproxy']
node.override['nginx']['port'] = '80'

node.override['nginx']['socketproxy']['root'] = '/var/www/apps'

node.override['nginx']['socketproxy']['default_app'] = 'hutchbase'
node.override['nginx']['socketproxy']['apps'] = {
  'hutchbase' => {
    'subdir' => 'hutchbase',
    'socket' => {
      'type' => 'tcp',
      'port' => '8443'
    }
  }
}
