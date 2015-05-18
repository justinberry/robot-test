require 'spec_helper'
require 'control_panel'
require 'robot'
require 'table'
require 'facing'

describe 'control panel' do

  let(:robot) { Robot.new }
  let(:control_panel) { ControlPanel.new(robot) }
 
  describe '#place' do 
    before do
      expect(robot.x).to eq(0)
      expect(robot.y).to eq(0)
    end

    it 'forwards to mover to instantly set robot position' do
      robot.mover = double()
      expect(robot.mover).to receive(:teleport).with(1, 2)
      control_panel.place(1, 2, Facing::NORTH) 
    end

    it 'forwards to facing to update direcotion' do
      robot.facing = double()
      expect(robot.facing).to receive(:update).with(Facing::EAST)
      control_panel.place(1, 2, Facing::EAST)
    end
  end

  describe '#move' do
   before { robot.mover = double() }    
    it 'forwards to mover' do
      expect(robot.mover).to receive(:go)
      control_panel.move
    end
  end

  context 'direction' do
    before { robot.facing = double() }

    describe '#right' do
      it 'forwards to facing' do
        expect(robot.facing).to receive(:turn_right)
        control_panel.right()
      end
    end

    describe '#left' do
      it 'forwards to facing' do
        expect(robot.facing).to receive(:turn_left)
        control_panel.left()
      end
    end
  end

  describe '#report' do
    it 'reports position and facing of robot' do
      control_panel.place(2, 3, Facing::EAST)
      expect{ control_panel.report }.to output("2,3,EAST\n").to_stdout
    end
  end
end 
