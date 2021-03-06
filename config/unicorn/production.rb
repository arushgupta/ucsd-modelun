root = '/var/www/ucsd_mun/current'
working_directory root
pid "#{root}/tmp/pids/unicorn.pid"
stderr_path "#{root}/log/unicorn_stderr.log"
stdout_path "#{root}/log/unicorn_stdout.log"
listen '/tmp/unicorn.ucsd_mun.sock'
listen 8080
worker_processes 2
timeout 360




# working_directory '/var/www/ucsd_mun/current'
# pid '/var/www/ucsd_mun/current/tmp/pids/unicorn.pid'
# stderr_path '/var/www/ucsd_mun/log/unicorn.log'
# stdout_path '/var/www/ucsd_mun/log/unicorn.log'
# listen '/tmp/unicorn.ucsd_mun.sock'
# worker_processes 2
# timeout 30

# before_fork do |server, worker|
#   old_pid = "/var/www/microsweepstakes/current/tmp/pids/unicorn.pid.oldbin"
#   if old_pid != server.pid
#     begin
#     sig = (worker.nr + 1) >= server.worker_processes ? :QUIT : :TTOU
#     Process.kill(sig, File.read(old_pid).to_i)
#     rescue Errno::ENOENT, Errno::ESRCH
#     end
#   end
# end