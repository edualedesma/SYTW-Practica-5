source 'https://rubygems.org'

gem 'data_mapper'
gem 'sinatra-contrib'
gem 'haml'

gem 'sinatra'
gem 'omniauth'
gem 'omniauth-google-oauth2'
gem 'pry'
gem 'erubis'

group :development, :test do
	gem 'sqlite3'
	gem "dm-sqlite-adapter"
end

group :production do
    gem "pg"
    gem "dm-postgres-adapter"
end

group :test do
	gem "rack-test"
	gem "rake"
end