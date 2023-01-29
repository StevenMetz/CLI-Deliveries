require "csv" # calls the CSV class thats built into ruby
require "./methods" # gets all the methods from our methods.rb file
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

# two empty arrays  and a empty hash to store our data
address_name = {}  #empty hash for address name pairings
ss_keys = []     # empty array for ss_keys to be matched to names
ss_with_delivery = []  #empty array for address name hash and ss keys to be paired

#loop through even addresses
if sorted_even_names_by_vowels.length != 0 # check to see if even names aren't empty
  index = 0
  while index < sorted_even_names_by_vowels.length # loop through the names
    # check to make sure there are index left in addresses and in names
    if @even_address.length != 0 && sorted_even_names_by_vowels[index].length != 0 
      ss = even_street(sorted_even_names_by_vowels[index]) # makes base SS
      ss = ss * 1.50  # adds Special SS bonus
      ss_keys << ss   # moves SS to ss keys array
      address_name[sorted_even_names_by_vowels[index]] = @even_address[index] # pairs name and address in address name variable
      @even_address[index].delete #removes address thats been paired from orginal array
      sorted_even_names_by_vowels[index].delete # removes paired name from original array
    end
    index += 1 # increses index by 1 
  end
end
names_left = []  # Variable declared to put left over names in
# Conditional to see if either even_address is empty or even_names is empty then if even address
if @even_address.length == 0 && @even_names.length != 0
  @even_names.each do |i| #loops through even names array
    names_left << i  # moves names left over into new array
  end
end
# loop through the odd names
if sorted_odd_names.length != 0 # check to make sure there are odd names in array
  index = 0 # set index to 0
  while index < sorted_odd_names.length # loops though odd names
    if @odd_address.length != 0 && sorted_odd_names.length != 0 # checks to make sure there are addresses left and names are left
      ss = odd_street(sorted_odd_names[index]) # Sets base SS for odd addresses
      ss = ss * 1.50 # applies special ss bonus for odd names on odd addresses
      ss_keys << ss # moves the ss into keys 
      address_name[sorted_odd_names[index]] = @odd_address[index] # pairs name to address
      @odd_address[index].delete # removes paired address from ariginal array
      sorted_odd_names[index].delete # removes paired name from original array
    end
    index += 1 #increases index by 1 
  end
end
# check if odd addresses are empty and if odd names are not empty
if @odd_address.length == 0 && @odd_names.length != 0
  @odd_names.each do |i|
    # moves odd names left over to new variable
    names_left << i
  end
end
#loop through the remaining names if any starting with evens
names_left = sort_by_vowels(names_left) # sorts names left by vowels 
# check if vowels in frist name are greater than the consonants since vowels and even addresses have greater SS
if vowels?(names_left[0]) > consts?(names_left[0]) 
  if names_left.length != 0 && @even_address.length != 0 # Make sure both arrays aren't empty
    index = 0 # index variable reset to 0 
    while index < @even_address.length # loop though addresses
      if names_left.length != 0 && @even_address.length != 0
        ss = even_street(names_left[index]) # set base SS
        ss_keys << ss # move SS to SS keys for pairing
        address_name[names_left[index]] = @even_address[index] # pair name and address into hash
        @even_address[index].delete # remove address
        names_left[index].delete # remove name
      end
      index += 1 # increase index
    end
  end
end
if names_left.length != 0 && @odd_address.length != 0 # check that there are names and odd addresses left 
  names_left = sort_by_consonants(names_left) # names with most consonats are first
  index = 0 # set index back to 0 
  while index < @odd_address.length # loop through array
    if names_left.length != 0 && @odd_addresses.length != 0 # check to make sure names and addresses aren't empty
      ss = odd_street(names_left[index]) # set base ss
      ss_keys << ss # move ss to ss keys
      address_name[names_left[index]] = @odd_address[index] # make names and address pairs
      @odd_address[index].delete # remove address from array
      names_left.delete # remove name from array 
    end
    index += 1 # increase index by 1 
  end
end
#final output
ss_with_delivery = ss_keys.zip(address_name).sort.reverse # pairs the keys to the names/address pairs 
ss_total = ss_keys.sum # adds all the ss together to get total 
p ss_with_delivery # prints the names with their perspective ss to terminal
p ss_total # prints the total ss to terminal
