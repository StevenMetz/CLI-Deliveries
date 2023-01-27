require "csv"
require "./methods"
# Function to read names from a CSV file
def read_names(file)
  @names = []
  CSV.foreach(file) do |row|
    @names << row[0].downcase.strip
  end
  @names
end

# Function to read addresses from a CSV file
def read_addresses(file)
  addresses = []
  CSV.foreach(file) do |row|
    addresses << row[0].downcase.strip
  end
  addresses
end

#Main Program

puts "Enter name of file containing names:"
name_file = gets.chomp # gets names from user with file
names = read_names(name_file) # puts those names into an array

puts "Enter name of file containing addresses:"
# gets addresses from the user

address_file = gets.chomp

# puts addresses into array

addresses = read_addresses(address_file)

# This puts our address array into odds and evens.

make_two_new_arrays_for_addresses(addresses)
# Move names to even and odd arrays

split_names_to_evens_and_odds(names)
#sort even array by vowels most vowels first
sorted_even_names_by_vowels = sort_by_vowels(@even_names)
#sort odd names array with most consonants first
sorted_odd_names = sort_by_consonants(@odd_names)
# SS for the even streets
ss = even_street(sorted_even_names_by_vowels[0])
special_ss = ss * 1.50
total_ss = 0
total_ss = total_ss + ss
# two empty arrays  and a empty hash to store our data
address_name = {}
ss_keys = []
ss_with_delivery = []

#loop through even addresses
index = 0
while index < @even_address.length
  if sorted_even_names_by_vowels.length != 0
    ss = even_street(sorted_even_names_by_vowels[index])
    ss = ss * 1.50
    ss_keys << ss
    address_name[sorted_even_names_by_vowels[index]] = @even_address[index]
  end
  index += 1
end

# #final output
# address_name.each_pair { |k, v| ss_with_delivery << { k => v } }
# ss_with_delivery = keys.zip(new_array).to_a
p "even addresses", @even_address
p "odd addresses", @odd_address
p "even Names", @even_names
p "odd Names", @odd_names
p ss_keys
p address_name
