class CSVParser
  attr_accessor :path, :csv
  def initialize(path)
    @path = path
  end

  def build_csv_and_save
    # binding.pry
    CSV.foreach(self.path, :headers=>:first_how) do |line|
      guest = Guest.new(line)
      guest.save_on_database
    end
  end
end
