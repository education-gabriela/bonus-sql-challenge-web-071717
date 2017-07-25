require 'bundler'
require 'pry'
require 'csv'
require_relative "../lib/CSVParser.rb"
require_relative "../lib/Guest.rb"
require_relative "../lib/Import.rb"
Bundler.require

# Setup a DB connection here
importer = Import.new

db = Import.db_instance
if db.execute("SELECT count(*) FROM guests").first.first == 0
  Import.run
end
