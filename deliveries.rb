require "csv"
require "./methods"
# Function to read names from a CSV file
def read_names(file)
  @names = []
  CSV.foreach(file) do |row|
    @names << row[0].downcase
  end
  @names
end

# Function to read addresses from a CSV file
def read_addresses(file)
  addresses = []
  CSV.foreach(file) do |row|
    addresses << row[0].downcase
  end
  addresses
end

#Main Program

puts "Enter name of file containing names:"
name_file = gets.chomp # gets names from user with file
names = read_names(name_file) # puts those names into an array

puts "Enter name of file containing addresses:"
address_file = gets.chomp # gets addresses from the user
addresses = read_addresses(address_file) # puts addresses into array
make_two_new_arrays_for_addresses(addresses) # This puts our address array into odds and evens.
# sort_by_consonants(@names)
# sort_by_vowels(@names)
split_names_to_evens_and_odds(names)
p "even addresses", @even_address
p "odd addresses", @odd_address
p "even Names", @even_names
p "odd Names", @odd_names
