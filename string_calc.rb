class StringCalc
  def self.add(string)
    string = string.strip
    if string.empty?
      return 0           # Returns 0 when empty string is passed or the string with just empty space is passed
    else
      string_arr = string.split(',').map(&:to_i)      #converts the string to array of integers
      return string_arr.sum       # Returns sum of numbers present into the string
    end
  end
end
