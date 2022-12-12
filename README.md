# Terraform guide

1. Установи yandex cloud cli и terraform https://cloud.yandex.ru/docs/tutorials/infrastructure-management/terraform-quickstart
2. Перейди в папку infra/terraform и выполни `terraform apply`
3. Запомни IP виртуальной машины

# Ansible guide

1. Установи ansible https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html#pip-install 
2. Перейди в папку infra/ansible
3. Замени ip в файле inventory.yml на IP своей вирт. машины
4. Выполни команду `ansible-playbook playbook.yml -i inventory.yml -vv`
5. Дождись завершения

Ваш сервер готов к работе.

# Terraform guide part 2
1. Что бы удалить вирт. машину перейди в папку infra/terraform и выполни команду `terraform destroy`

