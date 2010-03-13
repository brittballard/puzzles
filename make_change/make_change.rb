class ChangeCalculator
  def self.make_change(amount, coins)
    remaining_amounts = Array.new(coins.length, amount)
    solutions = []
    coins.each{ solutions << Hash[*coins.map{ |coin_value| [coin_value, 0] }.flatten]}
    coins.sort! {|x,y| y <=> x }

    coins.each_index do |index|
      coin_value = coins[index]
      for i in 0..index
        calculate(coin_value, i, solutions, remaining_amounts)
      end
    end
    
    winner = determine_winner(solutions)
    coins.map{ |coin_value| Array.new(winner[coin_value], coin_value) }
  end
  
  private
  
  def self.calculate(coin_value, index, solutions, remaining_amounts)
    solutions[index][coin_value] = remaining_amounts[index] / coin_value
    remaining_amounts[index] -= solutions[index][coin_value] * coin_value    
  end
  
  def self.determine_winner(solutions)
    solutions.sort! do |a,b|
      sum(a.values) <=> sum(b.values)
    end
    
    solutions[0]
  end
  
  def self.sum(an_array)
    an_array.inject(0) { |sum, value| sum += value }
  end
end