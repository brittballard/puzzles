class ChangeCalculator
  def self.make_change(amount, coins)
    remaining_amounts = Array.new(coins.length, amount)
    change_amounts = Hash[*coins.map{ |coin_value| [coin_value, 0] }.flatten]
    coins.sort! {|x,y| y <=> x }
    coins.each_index do 
      coin_value = coins[index]
      change_amounts[coin_value] = remaining_amount / coin_value
      remaining_amount -= change_amounts[coin_value] * coin_value
      break if remaining_amount == 0
    end
    
    coins.map{ |coin_value| Array.new(change_amounts[coin_value], coin_value) }
  end
end