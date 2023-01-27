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
name_file = gets.chomp
names = read_names(name_file)

puts "Enter name of file containing addresses:"
address_file = gets.chomp
addresses = read_addresses(address_file)
sort_by_consonants(@names)
sort_by_vowels(@names)
make_two_new_arrays(addresses)
p @names_cons, "names consonants"
p @names_vowels, "names vowels"
p @even_address, "even addresses"
p @odd_address, "odd addresses"
