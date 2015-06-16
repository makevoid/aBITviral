# lib

def popen_read(cmd, dir: nil)
  cmd = "cd #{dir} && #{cmd}" if dir
  puts "executing: #{cmd}"
  Thread.abort_on_exception = true
  Thread.new {
    IO.popen cmd, 'r+' do |f|
      puts f.gets
    end
  }
end


class Buildr
  def self.server
    popen_read "python -m SimpleHTTPServer 3000", dir: "public"
  end

  def self.guard
    puts `bundle exec guard`
  end
end


# rakefile

task default: [:server_and_guard]

task :server_and_guard do
  Buildr.server
  Buildr.guard
end

task :server do
  Buildr.server
end

task :guard do
  Buildr.guard
end
