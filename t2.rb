
#LOOP_COUNT = 1_000_000
LOOP_COUNT = 100_000_000

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

results << adder_loop() 

puts results.inspect
