Dir[File.join(File.dirname(__FILE__),"lib/**/lib")].each {|dir| $LOAD_PATH << dir}
require 'git-style-binary/command'

$yadr = `find -L ~ -maxdepth 2 -type f -name .yadr | head | sed 's:\.yadr\/::'`.chomp
