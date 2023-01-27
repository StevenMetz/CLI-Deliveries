### Create Method to count vowels inside drivers name when street is even
def even_street(name)
  vowels = 0
  index = 0
  while index < name.length
    if name[index] =~ /[aeiou]/ # uses regex to determine if string index is a vowel
      vowels += 1
    end
    index += 1
  end
  @ss_vowels = vowels * 1.5
  return @ss_vowels
end

# for odd street length
def odd_street(name)
  @consts = 0
  index = 0
  while index < name.length
    if name[index] !~ /[aeiou]/ # uses regex to determin if string index is not a vowel
      @consts += 1
    end
    index += 1
  end
  return @consts  #only returns consts because ss is multiplied * 1
end

def vowels?(name)
  vowels = 0
  index = 0
  while index < name.length
    if name[index] =~ /[aeiou]/ # uses regex to determine if string index is a vowel
      vowels += 1
    end
    index += 1
  end
  return vowels
end

def consts?(name)
  consts = 0
  index = 0
  while index < name.length
    if name[index] !~ /[aeiou]/ # uses regex to determin if string index is not a vowel
      consts += 1
    end
    index += 1
  end
  return consts
end

#puts the addresses into even and odd addresses

def make_two_new_arrays_for_addresses(addresses)
  @odd_address = []
  @even_address = []
  addresses.each do |address|
    if address.gsub(/\s+/, "").length % 2 != 0
      @odd_address << address
    else
      @even_address << address
    end
  end
end

# sorts array by the vowels

def sort_by_vowels(names)
  names.sort_by! { |str| str.count("aeiouAEIOU") }
  @names_vowels = names.reverse
  return @names_vowels
end

#sorts names by their consonants
def sort_by_consonants(names)
  names.sort_by! { |str| str.scan(/[^aeiou]/).size }
  @names_cons = names.reverse
  return @names_cons
end

# split the names to evens and odds

def split_names_to_evens_and_odds(names)
  @even_names = []
  @odd_names = []
  names.each do |name|
    if name.gsub(/\s+/, "").length % 2 == 0
      @even_names << name
    else
      @odd_names << name
    end
  end
end
