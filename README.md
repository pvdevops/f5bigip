# Introduction 
Ansible playbooks for F5 configurations and updates across various environments 

Steps to set up on any new ansible workstaion box:
  - ssh from the new ansible workstation box to the F5 box with F5 admin id. ssh backwards from the F5 box to the new ansible work station box. This adds ssh public key to both the boxes for passwordless login.
  - Also run the command ssh-copy-id admin@10.26.32.54 from ansible work station to copy the publick key to the remote F5 box 10.26.32.54
  - Go to https://dev.azure.com/LPLTechnology/_usersSettings/keys and add the ansible workstation public key. You can find the public key on the ansible work staion under the .ssh directory. ex: /root/.ssh/id_rsa.pub
  - On the new ansible workstation, create a new directory, say $HOME/ansiblerepo/ and run git commands to clone the repository
      - git clone git@ssh.dev.azure.com:v3/LPLTechnology/Ansible/F5
      - git checkout development
  - cd F5/
  - ansible -i hosts qa_f5int -m ping -u admin --ask-pass /* To test if the connectivity between ansible workstation and F5 boxes is good through ansible */
  - ansible-playbook -i hosts site.yml  /* To execute the playbooks */

New Ansible PROD boxes - 10.25.25.100 (East) 10.35.25.100 (West) VIP-asnauto.corp.lpl.com

References:
https://clouddocs.f5.com/products/orchestration/ansible/devel/usage/getting_started.html
https://github.com/vinnie357/f5-ansible-workspace
https://github.com/f5devcentral/ansible-role-f5_atc_deploy_declaration 
https://github.com/kairen/kubeadm-ansible 

