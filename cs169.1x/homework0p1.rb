# arr.reduce(0, :+) means 0 + arr[0] + arr[1] + ...
def sum(arr)
  arr.reduce(0, :+)
end

def max_2_sum(arr)
  return sum(arr) if arr.length <= 1
  max2 = arr.sort[-2..-1]
  max2[0] + max2[1]
end

#
# gotcha:
#   'and' is NOT good for logical operations!  Yes, you can use it; but
#   better use it for other purposes.  The 'and' and 'or' operators were
#   actually borrowed from Perl; they are usually used for conditional
#   executions, although you can use them in expressions if you are careful.
#   Basically, 'foo and bar' is just another way of saying 'bar if foo'.
#   For example:
#       friends.include? 'Suzuka' and puts 'Mom, I got a new (girl)friend!'
#   You'll be surprised if you try something like 'a = b and c': Ruby will
#   evaluate 'a=b' first, and, if a is true-ish, return c happily.
#
def sum_to_n?(arr, n)
  # I don't really get it.  If we return true for ([], 0), why don't we
  # return true for ([1,2,3], 0)?
  # Btw, I'd be more explicit: return n == 0 if arr.empty?
  # (some folks prefer n.zero?, though)
  n == 0 && arr.empty? and return true

  # I'm not sure if you are concerned with performace.  I duplicate the Array
  # to make the code cleaner.  But it happens to be faster too: duplicating
  # once and popping n times is more efficient than slicing O(n) times.
  #arr = arr.dup
  #while x = arr.pop
  #  return true if arr.any? {|y| x + y == n }
  #end
  #false

  # This is the most expressive way, I guess.  Thanks, Matz!  You can never
  # imagine how short and expressive you can get in Ruby (at the same time).
  # Just FYI: Array#combination returns an Enumerator, so don't worry about
  # the performance.
  arr.combination(2).any? {|x,y| x + y == n }
end
