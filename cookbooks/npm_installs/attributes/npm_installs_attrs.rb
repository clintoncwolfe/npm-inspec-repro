default['camsa']['chefserver']['npm']['packages'] = [
  {
    'name': 'statsd',
    'version': '0.8.4',
    'options': [
      '-g'
    ]
  },
  {
    'name': 'azure-storage',
    'path': '/usr/local/camsa/statsd/azure-queue',
    #'path': '%s/statsd/azure-queue' % [node['camsa']['dirs']['working']]
  },
  {
    'name': 'sprintf-js',
    'path': '%s/statsd/azure-queue' % [node['camsa']['dirs']['working']]
  }
]
