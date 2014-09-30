task(:default) do 
  require './test/test.rb' 
end

desc "Testing"
task :test => :default

desc "Service"
task :server do
  sh "ruby twitter.rb"
end
  
