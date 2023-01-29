### Create Method to count vowels inside drivers name when street is even
def even_street(name)
  vowels = 0 # declare vowels set to 0
  index = 0 # declare index set to 0
  name = name.gsub(/\s+/, "") # removes all white space from names for accurate character matching

  while index < name.length # loops through names
    if name[index] =~ /[aeiou]/ # uses regex to determine if string index is a vowel
      vowels += 1 # increases vowels count by 1
    end
    index += 1 # increases index by 1
  end
  @ss_vowels = vowels * 1.5 # math for SS
  return @ss_vowels # returns variable and makes it available for through out program
end

# for odd street length
def odd_street(names)
  consts = 0 # declare consonants short handed to 0
  index = 0 # declare index set to 0
  names = names.gsub(/\s+/, "") # removes all white space from names for accurate character matching
  while index < names.length
    if names[index] !~ /[aeiou]/ # uses regex to determin if string index is not a vowel
      consts += 1 # increases consts count by 1
    end
    index += 1 #increases index by 1
  end
  return consts  #only returns consts because ss is multiplied * 1
end

#puts the addresses into even and odd addresses

def make_two_new_arrays_for_addresses(addresses)
  @odd_address = [] # empty array for odd addresses
  @even_address = [] # empty array for even addresses
  addresses.each do |address| #loops through addresses by each address
    # removes all white space from names for accurate length and checks if length is odd
    if address.gsub(/\s+/, "").length % 2 != 0
      @odd_address << address # moves odd address to odd addresses
    else
      @even_address << address # moves all addresses that weren't odd to even addresses
    end
  end
  # sorts addresses by length
  @odd_address = sort_by_length(@odd_address)
  @even_address = sort_by_length(@even_address)
end

# sort addresses by length greatest to least
def sort_by_length(addresses)
  addresses.sort_by! { |str| str.length }.reverse
end

# sorts array by the vowels

def sort_by_vowels(names)
  names.sort_by! { |str| str.count("aeiouAEIOU") } # does the sorting from least to greatest
  @names_vowels = names.reverse # sorts the names by greatest amount vowels
  return @names_vowels
end

#sorts names by their consonants
def sort_by_consonants(names)
  names.sort_by! { |str| str.scan(/[^aeiou]/).size }
  @names_cons = names.reverse # sorts the names by greatest amount of consonants to least
  return @names_cons
end

# split the names to evens and odds

def split_names_to_evens_and_odds(names)
  @even_names = [] # empty array for even names
  @odd_names = [] # empty array for odd names
  names.each do |name| #loops through names by each name
    if name.gsub(/\s+/, "").length % 2 == 0 # checks if name is even and removes white space to only count characters
      @even_names << name # moves names to even names
    else
      @odd_names << name  # moves other names to odd names
    end
  end
end

# counts just consonants for comparison
def consts?(name)
  consts = 0 # sets const to 0
  index = 0 # declare index set to 0
  name = name.gsub(/\s+/, "") # removes white space for accurate consonant matching
  while index < name.length #loops through names while index is less than length
    if name[index] !~ /[aeiou]/ # uses regex to determin if string index is not a vowel
      consts += 1 # increases consts by 1
    end
    index += 1 # increases index by 1
  end
  return consts #returns the consts count
end

# counts all the vowels in name for comparison
def vowels?(name)
  vowels = 0 # declare vowels set to 0
  index = 0 # declare index set to 0
  name = name.gsub(/\s+/, "") # removes white space for accurate vowel matching

  while index < name.length # loops through names while index is less than length
    if name[index] =~ /[aeiou]/ # uses regex to determine if string index is a vowel
      vowels += 1 # increase vowels by 1
    end
    index += 1 # increases index by 1
  end
end

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

name = ["odd", "odd"]
p odd_street(name[0])
