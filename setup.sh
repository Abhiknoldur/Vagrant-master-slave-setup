sudo apt-add-repository ppa:ansible/ansible
sudo apt update
sudo apt install ansible
sudo apt install virtualbox
sudo apt update
curl -O https://releases.hashicorp.com/vagrant/2.2.6/vagrant_2.2.6_x86_64.deb
sudo apt install ./vagrant_2.2.6_x86_64.deb
vagrant plugin install vagrant-hostsupdater --plugin-version=1.0.2
