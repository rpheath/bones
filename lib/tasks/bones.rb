require File.join(File.dirname(__FILE__), '..', 'cache.rb')

task :default => :server

desc "Start bones server"
task :server do
  ARGV.shift
  load File.join(File.dirname(__FILE__), '..', 'server.rb')
  BonesServer.run
end

desc "Cache page templates for redistribution (non-versioned)"
task :cache => 'cache:simple'

namespace :cache do
  def generate_options_from_environment(extra={})
    returning Bones::Cache::Options.new do |options|
      options.base = ENV['BASE'] if ENV['BASE']
      options.destination = ENV['DESTINATION'] if ENV['DESTINATION']
      extra.each do |k, v|
        options.send("#{k}=", v)
      end  
    end  
  end
  
  task :simple do
    options = generate_options_from_environment
    Bones::Cache.run(options)
  end
  
  desc "Cache page templatets for redistribution (versioned)"
  task :versioned do
    options = generate_options_from_environment(:versioned => true)
    Bones::Cache.run(options)
  end
end

namespace :specs do
  desc "runs all of the spec files located in spec/"
  task :run do
    # TODO
    # fix so that specs are loaded
    # based on whatever is in the 
    # directory (including sub-directories)
    # based on the _spec.rb$ regex
    specs = [
      'bones_spec.rb',
      'boot_spec.rb',
      'cache_spec.rb',
      'extensions_spec.rb',
      'helpers/core_helper_spec.rb'
    ]
  
    specs.each do |f|
      puts "** Executing #{f}"
      # TODO
      # fix so that specs can be
      # executed from within either
      # directory: lib/ or bones/
      # (currently assumes lib/)
      system "spec ../spec/#{f}"
    end
  end
end

task :clean do
  # TODO
  # ARGV.shift
  # ARGV.unshift '--clean'
  # load File.join(File.dirname(__FILE__), 'cache.rb')
end