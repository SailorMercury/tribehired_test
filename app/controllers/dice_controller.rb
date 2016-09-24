class DiceController < ApplicationController

	def index
    hash = nil
    hash = {1=>params[:p1],2=>params[:p2],3=>params[:p3],4=>params[:p4]} if (!params[:p1].blank? || !params[:p2].blank? || !params[:p3].blank? || !params[:p4].blank?)
    
	  @hash = Dice.roll(hash)
	end

end
