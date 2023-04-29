server '103.98.149.218', user: 'root', roles: %w{web app db},
   :ssh_options => {
     :keepalive => true,
     :keepalive_interval => 60 #seconds
   }