class StringCalc
  def self.add(string)
    string = string.strip
    if string.empty?
      return 0           # Returns 0 when empty string is passed or the string with just empty space is passed
    else
      delimiter = /[,\n;]/
      string_arr = string.split(delimiter)        # This will split the string with multiple delimiters
      sum = string_arr.map(&:to_i).sum        # Convert the array of strings to an array of integers and calculate the sum
    end
  end
end
