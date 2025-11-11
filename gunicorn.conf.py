import multiprocessing, os

workers = int((multiprocessing.cpu_count() * 2) + 1)

bind = "0.0.0.0:8000"
timeout = 10
graceful_timeout = 10
loglevel = "info"

# Write to files on the shared volume
accesslog = "/logs/app/gunicorn.access.log"
errorlog  = "/logs/app/gunicorn.error.log"

worker_tmp_dir = "/dev/shm"
