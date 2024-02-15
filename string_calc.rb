class StringCalc
  def self.add(string)
    string = string.strip
    if string.empty?
      return 0           # Returns 0 when empty string is passed or the string with just empty space is passed
    else
      delimiter = /[,\n; ]/        # Given the delimiters as space, comma, semi colon, and new line
      regex = /\s*-?\d+\s*/         # Regex to match the number inside the string

      string_arr = string.split(delimiter)        # This will split the string with multiple delimiters
      string_arr = string_arr.map {|x| x.match(regex)}.compact        # Match the numbers and removes nil elements
      string_arr = string_arr.map {|y| y[0].to_i}         # Maps each element to integer
      numbers = string_arr.map(&:to_i)        # Convert the array of strings to an array of integers

      # Raise an error if negative numbers are present into the string
      negative_numbers = numbers.select {|x| x < 0 }
      raise ArgumentError, "Negative numbers are not allowed: #{negative_numbers.join(',')}" if negative_numbers.any?

      sum = numbers.sum
    end
  end
end
