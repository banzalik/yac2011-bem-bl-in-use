$:.unshift(File.join(File.dirname(__FILE__), 'lib'))

# for rb-inotify/rb-fsevent
require 'rubygems'

require 'fssm'

FSSM.monitor('pages/', '**/*.bemjson.js') do
#  update { |b, r| puts "Update in #{b} to #{r}" }
	update { |b, r| puts "Изменения в файле #{b}/#{r}"
		puts `make`
		puts "Ребилд завершен" 
	}
  delete { |b, r| puts "Delete in #{b} to #{r}" }
  create { |b, r| puts "Create in #{b} to #{r}" }
end
