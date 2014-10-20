
#LOOP_COUNT = 1_000_000
LOOP_COUNT = 100_000_000

def simple_loop
  total = 0
  0.upto(LOOP_COUNT) do |i|
      total = total + i
  end
  total
end

results = []

results << simple_loop() 

puts results.inspect
