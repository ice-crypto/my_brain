server '133.125.37.78',
    user: 'deployer',
    roles: %w{app db web},
    ssh_options: {
      port: 12089,
      user: 'deployer',
      keys: %w(~/.ssh/my_server/id_rsa),
      forward_agent: true
    }
