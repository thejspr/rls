require 'rls/version'
require 'open3'
class RLS::Runner < Struct.new(:options)

  def self.run(options)
    new(options).release!
  end

  def release!
    say 'Debug run...' if debug
    # show diff log since last deploy
    # ensure all commits are pushed to github
    # deploy
    execute "git push #{options[:remote]} #{branch} #{force ? '-ff' : ''}"
    # notify newrelic
    execute "newrelic deployments -a #{app_name} #{newrelic_env}" if app_name.size > 0
    # run any migrations (backup before)
  end

  def execute(cmd)
    cmd.strip!
    say "Running: #{cmd}"
    return true if debug
    result = Open3.popen2e(cmd) do |stdin,stdout,wait_thr|
      stdout.each{ |l| puts l.chomp }
      wait_thr.value
    end

    unless result.success?
      $stderr.puts "command: '#{cmd}' returned an error"
      exit(1)
    end
  end

  def newrelic_env
    env.size > 0 ? "-e #{env}" : ''
  end

  def say(message)
    puts message
  end

  def method_missing(m, *args, &block)
    options.key?(m.to_sym) ? options[m.to_sym] : super
  end
end
