begin
  require "jeweler"
  require "./lib/inkling/version"
  Jeweler::Tasks.new do |gem|
    gem.name = "inkling"
    gem.summary = "A content framework engine for Rails 3"
    gem.description = "A content framework engine for Rails 3"
    gem.files = Dir["{lib}/**/*", "{app}/**/*", "{config}/**/*"]
    gem.version = Inkling::VERSION
    gem.add_dependency("devise")
    gem.add_dependency("inherited_resources")
    gem.add_dependency("formtastic")
    gem.add_dependency("cancan")    
    # gem.add_dependency("differ")    
  end
rescue
  puts "Jeweler or one of its dependencies is not installed."
end
