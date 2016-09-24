class RobotController < ApplicationController

	def index
	  @robot = Robot.first
	  @robot = Robot.create(horizontal: 0, vertical: 0, facing: "EAST") if @robot.blank?
	end

  def place_robot
    @robot = Robot.first
    @robot.horizontal = params[:horizontal]
    @robot.vertical = params[:vertical]
    @robot.facing = params[:facing]
    if @robot.save
      redirect_to robot_path, notice: 'Robot placement succesful!'
    else
      redirect_to robot_path, alert: 'Robot placement Failed!'
    end
  end
  
  def move_robot
    @robot = Robot.first
    if params[:movement] == "RIGHT"
      @robot.turn("RIGHT")
    elsif params[:movement] == "LEFT"
      @robot.turn("LEFT")
    else
      @robot.move
    end 
    
    if @robot.save
      redirect_to robot_path, notice: 'Robot movement succesful!'
    else
      redirect_to robot_path, alert: 'Robot movement Failed!'
    end
    
  end

end
