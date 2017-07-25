class Guest
  attr_accessor :year, :occupation, :air_date, :group_name, :name, :user_hash

  def initialize(line)
    @user_hash = {}
    self.class.parse_line(line).collect do |key, value|
      self.user_hash[key] = value
      self.send("#{key}=", value)
    end
  end

  def self.parse_line(line)
    {
      :year => line["YEAR"],
      :occupation => line["GoogleKnowlege_Occupation"],
      :air_date => Date.strptime(line["Show"], "%m/%d/%y").to_s,
      :group_name => line["Group"],
      :name => line["Raw_Guest_List"]
    }
  end

  def save_on_database
    # binding.pry
    Import.insert_data(self.user_hash)
  end
end
