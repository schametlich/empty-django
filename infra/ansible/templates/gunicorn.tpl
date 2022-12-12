[Unit]
Description=gunicorn daemon 

After=network.target 

[Service]
User={{ username }}

WorkingDirectory={{ project_dir }}/{{ project_name }}

ExecStart=gunicorn --bind 127.0.0.1:8001 {{ project_name }}.wsgi:application

[Install]
WantedBy=multi-user.target
