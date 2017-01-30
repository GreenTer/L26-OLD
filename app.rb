#encoding: utf-8
require 'sinatra'
require 'rubygems'
require 'sqlite3'

def get_db
	db = SQLite3::Database.new 'barbershop.db'
	db.results_as_hash = true
	return db
end

configure do
	db = get_db
	db.execute 'CREATE TABLE IF NOT EXISTS
		"Users"
		(
			"id" INTEGER PRIMARY KEY AUTOINCREMENT,
			"username" TEXT,
			"phone" TEXT,
			"datestamp" TEXT,
			"barber" TEXT,
			"color" TEXT
		)'
end

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get "/about" do
	erb :about
end

get "/visit" do
	erb :visit
end

post "/visit" do

	@user_name  = params[:user_name]
	@user_phone = params[:user_phone]
	@user_time  = params[:user_time]
	@barber 	= params[:barber]
	@color 		= params[:color]

# Хеш

	hh = { 
		:user_name => 'Enter name', 
		:user_phone => 'Enter phone', 
		:user_time => 'Enter time' }

	@error = hh.select {|key,_| params[key] == ""}.values.join(", ")

	

	if @error != ''
		return erb :visit
	end

	db = get_db
	db.execute 'insert into
		Users
		(
			username,
			phone,
			datestamp,
			barber,
			color
		)
		values (?, ?, ?, ?, ?)', [@user_name, @user_phone, @user_time, @barber, @color]

	erb "<h2>Thank you! We will see you #{@user_time}</h2>"
end

#def is_parameters_empty? hh
#	hh.each do |key, value|

		# Если параметр пуст, то
#		if params[key] == ''
			# переменной error присвоить сообщение об ошибке
 			# а value из хеша hh это сообщение об ошибке
#			@error = hh[key]
#			return erb :visit
#		end

#	end	
#end

#	if @user_name == ''
#		@error = 'Enter your name'
# 		return erb :visit
#	end

get "/contacts" do
	erb :contacts
end