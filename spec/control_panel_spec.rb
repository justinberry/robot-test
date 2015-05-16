require 'spec_helper'
require 'control_panel'
require 'robot'
require 'table'
require 'facing'

describe 'control panel' do

  let(:robot) { Robot.new }
  let(:control_panel) { ControlPanel.new(robot) }
 
  describe '#place' do 
    it 'places robot at location' do
      expect(robot.x).to eq(0)
      expect(robot.y).to eq(0)
      control_panel.place(1, 2, Facing::NORTH) 
      expect(robot.x).to eq(1)
      expect(robot.y).to eq(2)
    end

    it 'sets direction of robot' do
      expect(robot.facing).to eq(Facing::NORTH)
      control_panel.place(1, 1, Facing::EAST) 
      expect(robot.facing).to eq(Facing::EAST)
    end

    it 'ignores placement of robot beyond width of the table' do
      control_panel.place(1, 0, Facing::EAST) 
      expect(robot.x).to eq(1)
      expect(robot.y).to eq(0)

      control_panel.place(5, 2, Facing::EAST) 

      expect(robot.x).to eq(1)
      expect(robot.y).to eq(0)
    end

    it 'ignores placement of robot beyond height of the table' do
      control_panel.place(0, 1, Facing::EAST)
      expect(robot.x).to eq(0)
      expect(robot.y).to eq(1)

      control_panel.place(2, 5, Facing::EAST)

      expect(robot.x).to eq(0)
      expect(robot.y).to eq(1)
    end
  end

  describe '#left' do
    it 'performs full rotation left' do
      expect(robot.facing).to eq(Facing::NORTH)
      control_panel.left()
      expect(robot.facing).to eq(Facing::WEST)
      control_panel.left()
      expect(robot.facing).to eq(Facing::SOUTH)
      control_panel.left()
      expect(robot.facing).to eq(Facing::EAST)
      control_panel.left()
      expect(robot.facing).to eq(Facing::NORTH)
    end
  end

  describe '#right' do  
    it 'performs full rotation right' do
      expect(robot.facing).to eq(Facing::NORTH)
      control_panel.right()
      expect(robot.facing).to eq(Facing::EAST)
      control_panel.right()
      expect(robot.facing).to eq(Facing::SOUTH)
      control_panel.right()
      expect(robot.facing).to eq(Facing::WEST)
      control_panel.right()
      expect(robot.facing).to eq(Facing::NORTH)
    end
  end

  describe '#move' do
    
    it 'moves north' do
      control_panel.place(2, 2, Facing::NORTH) 
      control_panel.move()
      expect(robot.y).to eq(3)
    end

    it 'moves south' do
      control_panel.place(2, 2, Facing::SOUTH) 
      control_panel.move()
      expect(robot.y).to eq(1)
    end

    it 'moves east' do
      control_panel.place(2, 2, Facing::EAST)
      control_panel.move()
      expect(robot.x).to eq(3)
    end 

    it 'moves west' do
      control_panel.place(2, 2, Facing::WEST)
      control_panel.move()
      expect(robot.x).to eq(1)
    end
  end

  describe '#report' do
    it 'reports position and facing of robot' do
      control_panel.place(2, 3, Facing::EAST)
      expect{ control_panel.report }.to output("2,3,EAST\n").to_stdout
    end
  end
end 
