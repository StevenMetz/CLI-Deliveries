### Create Method to count vowels inside drivers name when street is even
def even_street(name)
  @vowels = 0
  index = 0
  while index < name.length
    if name[index] =~ /[aeiou]/ # uses regex to determine if string index is a vowel
      @vowels += 1
    end
    index += 1
  end
  @ss_vowels = @vowels * 1.5
  return ss
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

def special_odd
  ss = @const + (@const * 0.05)
end

def special_even
  ss = @ss_vowels + (@ss_vowels * 0.05)
end

#puts the addresses into even and odd addresses

def make_two_new_arrays(addresses)
  @odd_address = []
  @even_address = []
  addresses.each do |address|
    if address.strip.length.odd?
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
  return @names
end

#sorts names by their consonants
def sort_by_consonants(names)
  names.sort_by! { |str| str.scan(/[^aeiou]/).size }
  @names_cons = names.reverse
  return names
end
