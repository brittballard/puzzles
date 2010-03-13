class ChangeCalculator
  def self.make_change(amount, coins)
    remaining_amounts = Array.new(coins.length, amount)
    change_amounts = Hash[*coins.map{ |coin_value| [coin_value, 0] }.flatten]
    solutions = Array.new(coins.length, change_amounts)
    coins.sort! {|x,y| y <=> x }

    coins.each_index do |index|
      coin_value = coins[index]
      for i in 0..index
        calculate(coin_value, i, solutions, remaining_amounts)
      end
    end
    
    coins.map{ |coin_value| Array.new(change_amounts[coin_value], coin_value) }
  end
  
  private
  
  def calculate(coin_value, index, solutions, remaining_amounts)
    solutions[index][coin_value] = remaining_amounts[index] / coin_value
    remaining_amounts[index] -= solutions[index][coin_value] * coin_value    
  end
  
  def determine_winner
    
  end
end