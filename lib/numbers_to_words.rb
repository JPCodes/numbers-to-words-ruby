diego = {
  0 => "",
  1 => "one ",
  2 => "two ",
  3 => "three ",
  4 => "four ",
  5 => "five ",
  6 => "six ",
  7 => "seven ",
  8 => "eight ",
  9 => "nine ",
  10 => "ten ",
  11 => "eleven ",
  12 => "twelve ",
  13 => "thirteen ",
  14 => "fourteen ",
  15 => "fifteen ",
  16 => "sixteen ",
  17 => "seventeen ",
  18 => "eighteen ",
  19 => "nineteen "
 }

james = {
  0 => " and ",
  2 => "twenty ",
  3 => "thirty ",
  4 => "forty ",
  5 => "fifty ",
  6 => "sixty ",
  7 => "seventy ",
  8 => "eighty ",
  9 => "ninety "
 }
 ted = {
   1 => "hundred ",
   2 => "thousand ",
   3 => "million ",
   4 => "billion ",
   5 => "trillion "
  }

define_method(:under_hundred) do
  if self < 20
   answer = diego.fetch(self)
 elsif self > 19
   answer = self.to_s.reverse!.split("").map.with_index{ |number,index|
     if index == 0
       diego.fetch(number.to_i)
     elsif index == 1
       james.fetch(number.to_i)
     end
   }
   answer = answer.reverse!.join("")
  end
end

define_method(:over_hundred) do
  puts "over hundred method"
  diego.fetch(self)+ted.fetch(1)
end

def chunk(string, size)
    string.scan(/.{1,#{size}}/)
end

define_method(:getNameFromThirds) do
  puts "get name from thirds"
  if self.to_s[-2,2].to_i < 100
    "if statement it should not come here"
    answer = self.to_i.under_hundred()
  end
  puts "in between the two ifs"
  if self.to_s[-3].to_i>=1
    puts "if statement where over hundred should be called"
    answer= self.to_s[-3].to_i.over_hundred() + self.to_s[-2,2].to_i.under_hundred()
  end
  answer
end

class Fixnum
  final=""
  define_method(:numbers_to_words) do
    blah=[]
    ted2 = {
      0 => "",
      1 => "thousand ",
      2 => "million ",
      3 => "billion ",
      4 => "trillion "
     }
    max = (self.to_s.length().to_f/3).ceil
    numbers=chunk(self.to_s,3).reverse!
    for i in 0..max-1
      blah.unshift(numbers[i].getNameFromThirds + ted2.fetch(i))
    end
    print blah.join("")
  end

end

109.numbers_to_words()
