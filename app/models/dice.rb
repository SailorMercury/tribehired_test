class Dice

  PLAYERS = 4

  def self.roll(result)
    hash = {}
    if result.nil?
      for i in 1..Dice::PLAYERS
        hash[i] = Array.new(6) { rand(1...7) }
      end
    else
      for i in 1..Dice::PLAYERS
        hash[i] = Array.new(result[i].count) { rand(1...7) } if !result[i].nil?
      end
    end
    return hash
  end
  
  def self.after_move_remove(hash)
    end_one = []
    for i in 1..Dice::PLAYERS
      #check last number is 1 and remove the dice
      if !hash[i].nil?
        if (hash[i].last == 1) && (i == Dice::PLAYERS)
          end_one << 1
          hash[i].pop
        elsif hash[i].last == 1
          end_one << i+1
          hash[i].pop
        end
        #check last number end
        
        #remove 6 from the array
        hash[i] = hash[i] - [6]
      end
    end
    #add the dice to respective player
    end_one.each do |id|
      hash[id] << 1 if !hash[id].nil?
    end
    return hash
  end
  
  
end
