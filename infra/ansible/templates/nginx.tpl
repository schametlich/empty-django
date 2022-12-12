server {
    listen 80;
    server_name {{ ansible_ssh_host }};

    location /static/ {
        root {{ project_dir }}/{{ project_name }}/;
    }
        
    location /media/ {
        root {{ project_dir }}/{{ project_name }}/;
    }

    location / {
        include proxy_params;
        proxy_pass http://127.0.0.1:8001;
    }
} 
