root = "/home/rails/current"
working_directory root
pid "/home/unicorn/pids/unicorn.pid"
stderr_path "/home/unicorn/log/unicorn.log"
stdout_path "/home/unicorn/log/unicorn.log"
 
# Port configuration
listen 8080
worker_processes 2
timeout 30
