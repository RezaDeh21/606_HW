# When done, submit this entire file to the autograder.

# Part 1

def sum arr
  sum = 0
  arr.each {|x| sum+=x}
  return sum
end

def max_2_sum arr
  return 0 if arr.empty?
  return arr[0] if arr.length == 1
  return arr.delete_at(arr.index(arr.max))+arr.delete(arr.max)
end

def sum_to_n? arr, n
  if arr.length > 1
    arr[0..-2].each {|x| 
        arr[x..-1].each {|y|return true if x+y==n}
    }
  end
return false
end

# Part 2

def hello(name) return "Hello, " + name end

def starts_with_consonant? s
  return false if s.empty?
  not_cons = ['A','a','E','e','I','i','O','o','U','u']
  return !not_cons.include?(s[0]) && s[0].match?(/[[:alpha:]]/)
end

def binary_multiple_of_4? s
  return s.match?(/^[01]+$/) && s.to_i(2)%4==0 
end

# Part 3

class BookInStock
  def initialize(_isbn, _price) 
    raise ArgumentError.new "_isbn can't be an empty string" if _isbn.empty?
    raise ArgumentError.new "price can't not be <= 0" if _price <= 0
    @isbn, @price = _isbn, _price.to_f
  end
  def isbn() @isbn end
  def isbn=(_isbn) @isbn = _isbn end
  def price() @price end
  def price=(_price) @price = _price end
  def price_as_string() '$' + '%.2f' % @price end
end