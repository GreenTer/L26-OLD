require 'sqlite3'

db = SQLite3::Database.new 'barbershop.db'
db.results_as_hash = true

db.execute 'selet * from Users' do |row|

	print row['user_name']
	print "\t-\t"
	print row['user_time']
	puts "========="

end