# Ansible Docker

arm64 version for MacOS
```sh
docker pull girish979/ansible:9.2.0
```

```docker run -it girish979/ansible:9.2.0 sh```

Run Docker Container with Ansible:
```sh
   docker run --rm -it -v /path/to/your/ansible/files:/ansible/playbooks girish979/ansible:9.2.0 sh
```

## Create Alias
```sh
alias ansible-docker='docker run --rm -it -v $(pwd):/ansible/playbooks girish979/ansible:9.2.0 sh -c'
```

```sh
source ~/.zshrc
```
Now you can run Ansible commands using the alias:   
```sh
ansible-docker "ansible-playbook /ansible/playbooks/your_playbook.yml"
```