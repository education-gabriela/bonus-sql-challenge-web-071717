class Import
  @@connection = nil

  def initialize()
    @@connection = SQLite3::Database.new('daily_show.db')
  end

  def self.db_instance
    @@connection
  end

  def self.run
    path = Dir.pwd + "/daily_show_guests.csv"
    csvparser = CSVParser.new(path)
    csvparser.build_csv_and_save
  end

  def self.insert_data(insert_hash)
    fields = insert_hash.keys.map { |x| x.to_s }.join(", ")
    values = insert_hash.values.map { |x| "\"#{x.gsub(/['"\\\x0]/,'')}\"" }.join(", ")
    sql = "INSERT INTO guests (#{fields}) VALUES (#{values})"
    self.db_instance.execute(sql)
  end
end
