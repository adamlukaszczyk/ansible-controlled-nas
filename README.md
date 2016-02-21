# ansible-controlled-nas

Ansible and ARM virtualization for testing environment insite one VirtualBox
https://github.com/pradels/vagrant-libvirt

Debian ARM images:
https://people.debian.org/~aurel32/qemu/armel/

## Setup steps

0. Clone this project; Make sure you have vagrant installed on your host.

0. Setup your host name / ip address to you NAS in Ansible's hosts config file `ansible/hosts`

0. Add your public SSH key to `authorized_keys` on your NAS

1. First time vagrant run:
> `$ vagrant up`

2. Go into the Vagrant
> `$ vagrant ssh`

3. Run Ansible to install the packages on your virtual NAS
> `ansible-playbook site.yml -u [user_name] -vvv --ask-sudo-pass`

## Usefull links
http://jamie.lentin.co.uk/devices/dlink-dns325/
http://docs.ansible.com/ansible/intro_getting_started.html#your-first-commands
https://www.digitalocean.com/community/tutorials/how-to-add-delete-and-grant-sudo-privileges-to-users-on-a-debian-vps