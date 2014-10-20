require 'benchmark'

#LOOP_COUNT = 1_000_000
LOOP_COUNT = 100_000_000

def simple_loop
  total = 0
  0.upto(LOOP_COUNT) do |i|
      total = total + i
  end
  total
end

class Adder
  def initialize() 
    @total = 0
  end
  def total
    @total
  end 
  def add(i)
    @total = @total + i
  end
end 

 
def adder_loop
  adder = Adder.new()
  0.upto(LOOP_COUNT) do |i|
      adder.add(i)
  end
  adder.total
end

results = []

Benchmark.bm do |x|
  x.report('simple loop') { results << simple_loop() }  # { for i in 1..n; a = "1"; end }
  x.report('abstraction')  {results << adder_loop() } 
#  x.report { 1.upto(n) do ; a = "1"; end }
end


puts results.inspect
