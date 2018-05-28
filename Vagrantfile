# -*- mode: ruby -*-
# vi: set ft=ruby :


Vagrant.configure("2") do |config|
  
  config.vm.box = "ubuntu/xenial64"
  
   #BALANCEADOR
  
   config.vm.define "balanceador" do |app|
    
        app.vm.hostname = "balanceador"
    
        app.vm.network "private_network", ip: "192.168.33.13"
    
        app.vm.provision "shell", path: "provision/provision-for-balanceador.sh"
    
      end
      
  #APACHE-1
  
  config.vm.define "web-1" do |app|
    
        app.vm.hostname = "web-1"
    
        app.vm.network "private_network", ip: "192.168.33.10"
    
        app.vm.provision "shell", path: "provision/provision-for-apache.sh"
        app.vm.provision "shell", path: "provision/nfs/nfs-server.sh" 
      end

  #APACHE-2
  
  config.vm.define "web-2" do |app|
    
        app.vm.hostname = "web-2"
    
        app.vm.network "private_network", ip: "192.168.33.11"
    
        app.vm.provision "shell", path: "provision/provision-for-apache.sh"
        app.vm.provision "shell", path: "provision/nfs/nfs-client.sh"
      end

  #MYSQL
  
  config.vm.define "mysql" do |app|
    
        app.vm.hostname = "mysql"
    
        app.vm.network "private_network", ip: "192.168.33.12"
    
        app.vm.provision "shell", path: "provision/provision-for-mysql.sh"
    
      end  
      
     

end
