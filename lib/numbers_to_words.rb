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
   answer = self.to_s.reverse!.split("").map.with_index{ |num,index|
     if index == 0
       diego.fetch(num.to_i)
     elsif index == 1
       if num.to_i == 1
         diego.fetch(num.to_i)
       elsif num.to_i != 1
         james.fetch(num.to_i)
       end
     end
   }
   answer = answer.reverse!.join("")
  end
end

define_method(:over_hundred) do
  diego.fetch(self)+ted.fetch(1)
end

def chunk(string, size)
    string.scan(/.{1,#{size}}/)
end

define_method(:getNameFromThirds) do

  if self.to_s[-2,2].to_i < 100
    answer = self.to_i.under_hundred()
  end

  if self.to_s[-3].to_i>=1
    answer= self.to_s[-3].to_i.over_hundred() + self.to_s[-2,2].to_i.under_hundred()
  end
  answer
end

class Fixnum
  final=""
  define_method(:numbers_to_words) do
    final=[]
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
      final.unshift(numbers[i].getNameFromThirds + ted2.fetch(i))
    end
    print final.join("")
  end

end


112345.numbers_to_words()
