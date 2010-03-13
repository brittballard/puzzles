class ChangeCalculator
  # Breadth first search
  def self.make_change(a, list = [25, 10, 5, 1])
   return nil if a < 0
   return nil if a != a.floor

   parents = Array.new(a + 1)
   parents[0] = 0
   worklist = [[0, 0]]
   while parents[a].nil? && !worklist.empty? do
     base, starting_index = worklist.shift
     starting_index.upto(list.size - 1) do |index|
       coin = list[index]
       tot = base + coin
       if tot <= a && parents[tot].nil?
         parents[tot] = base
         worklist << [tot, index]
       end
     end
   end

   return nil if parents[a].nil?
   result = []
   while a > 0 do
     parent = parents[a]
     result << a - parent
     a = parent
   end
   result.sort!.reverse!
  end
  
  # # One of their answers
  # def self.make_change(amount, coins = [25, 10, 5, 1])
  #  coins.sort! { |a, b| b <=> a }
  # 
  #  # memoize solutions
  #  optimal_change = Hash.new do |hash, key|
  #    hash[key] = if key < coins.min
  #      []
  #    elsif coins.include?(key)
  #      [key]
  #    else
  #      coins.
  #        # prune unhelpful coins
  #        reject { |coin| coin > key }.
  # 
  #        # prune coins that are factors of larger coins
  #        inject([]) {|mem, var| mem.any? {|c| c%var == 0} ? mem : mem+[var]}.
  # 
  #        # recurse
  #        map { |coin| [coin] + hash[key - coin] }.
  # 
  #        # prune unhelpful solutions
  #        reject { |change| sum(change) != key }.
  # 
  #        # pick the smallest, empty if none
  #        min { |a, b| a.size <=> b.size } || []
  #    end
  #  end
  # 
  #  optimal_change[amount]
  # end
  
  # My answer
  # def self.make_change(amount, coins)
  #     remaining_amounts = Array.new(coins.length, amount)
  #     solutions = []
  #     coins.each{ solutions << Hash[*coins.map{ |coin_value| [coin_value, 0] }.flatten]}
  #     coins.sort! {|x,y| y <=> x }
  # 
  #     coins.each_index do |index|
  #       coin_value = coins[index]
  #       for i in 0..index
  #         calculate(coin_value, i, solutions, remaining_amounts)
  #       end
  #     end
  #     
  #     winner = determine_winner(solutions)
  #     coins.map{ |coin_value| Array.new(winner[coin_value], coin_value) }
  #   end
  #   
  #   private
  #   
  #   def self.calculate(coin_value, index, solutions, remaining_amounts)
  #     solutions[index][coin_value] = remaining_amounts[index] / coin_value
  #     remaining_amounts[index] -= solutions[index][coin_value] * coin_value    
  #   end
  #   
  #   def self.determine_winner(solutions)
  #     solutions.sort! do |a,b|
  #       sum(a.values) <=> sum(b.values)
  #     end
  #     
  #     solutions[0]
  #   end
  #   
    def self.sum(an_array)
      an_array.inject(0) { |sum, value| sum += value }
    end
end