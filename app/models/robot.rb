class Robot < ActiveRecord::Base

  validates_presence_of :facing, :horizontal, :vertical
  validate :horizontal_and_vertical_cannot_more_than_4

  def horizontal_and_vertical_cannot_more_than_4
    if !self.horizontal.blank? && !self.vertical.blank?
      if (self.horizontal > 4 || self.vertical > 4 || self.horizontal < 0 || self.vertical < 0)
        errors[:base] << ("You will fall off the table!")
      end
    end
  end
  
  def move
    if self.facing == "NORTH"
      self.vertical = self.vertical-1
    elsif self.facing == "WEST"
      self.horizontal = self.horizontal-1
    elsif self.facing == "SOUTH"
      self.vertical = self.vertical+1
    elsif self.facing == "EAST"
      self.horizontal = self.horizontal+1     
    end
  end
  
  def turn(direction)
    if direction == "LEFT"
      if self.facing == "NORTH"
        self.facing = "WEST"
      elsif self.facing == "WEST"
        self.facing = "SOUTH"
      elsif self.facing == "SOUTH"
        self.facing = "EAST"
      elsif self.facing == "EAST"
        self.facing = "NORTH"        
      end
    else
      if self.facing == "NORTH"
        self.facing = "EAST"
      elsif self.facing == "WEST"
        self.facing = "NORTH"
      elsif self.facing == "SOUTH"
        self.facing = "WEST"
      elsif self.facing == "EAST"
        self.facing = "SOUTH"        
      end    
    end
  end
end
