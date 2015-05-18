require 'spec_helper'
require 'facing'

describe 'mover' do

  let(:robot) { Robot.new }
  let(:mover) { Mover.new(robot) }

  describe '#go' do
    before do
      robot.x = 2
      robot.y = 2
    end

    context 'when within bounds of table' do
      it 'moves north' do
        robot.facing.update(Facing::NORTH)
        mover.go()
        expect(robot.x).to eq(2)
        expect(robot.y).to eq(3)
      end

      it 'moves south' do
        robot.facing.update(Facing::SOUTH)
        mover.go()
        expect(robot.x).to eq(2)
        expect(robot.y).to eq(1)
      end

      it 'moves east' do
        robot.facing.update(Facing::EAST)
        mover.go()
        expect(robot.x).to eq(3)
        expect(robot.y).to eq(2)
      end

      it 'moves west' do
        robot.facing.update(Facing::WEST)
        mover.go()
        expect(robot.x).to eq(1)
        expect(robot.y).to eq(2)
      end
    end

    context 'when at of bounds of table' do
      it 'blocks going north' do
        robot.facing.update(Facing::NORTH)
        robot.y = Table::MAX_HEIGHT - 1
        mover.go()
        expect(robot.y).to eq(Table::MAX_HEIGHT - 1)
      end

      it 'blocks going south' do
        robot.facing.update(Facing::SOUTH)
        robot.y = 0
        mover.go()
        expect(robot.y).to eq(0)
      end

      it 'blocks going east' do
        robot.facing.update(Facing::EAST)
        robot.x = Table::MAX_WIDTH - 1
        mover.go()
        expect(robot.x).to eq(Table::MAX_WIDTH - 1)
      end

      it 'blocks going west' do
        robot.facing.update(Facing::WEST)
        robot.x = 0
        mover.go()
        expect(robot.x).to eq(0)
      end
    end
  end

  describe '#teleport' do
    before do
      robot.x = 0
      robot.y = 0
    end

    context 'position is valid' do
      it 'updates position' do
        mover.teleport(2,4)
        expect(robot.x).to eq(2)
        expect(robot.y).to eq(4)
      end
    end

    context 'position is invalid' do
      it 'ignores teleportation of robot beyond width of the table' do
        mover.teleport(5, 0)
        expect(robot.x).to eq(0)
        expect(robot.y).to eq(0)
      end

      it 'ignores teleportation of robot beyond height of the table' do
        mover.teleport(0, 5)
        expect(robot.x).to eq(0)
        expect(robot.y).to eq(0)
      end

      it 'ignores teleportation of robot for negative width value' do
        mover.teleport(-1, 0)
        expect(robot.x).to eq(0)
        expect(robot.y).to eq(0)
      end

      it 'ignores teleportation of robot for negative height value' do
        mover.teleport(0, -1)
        expect(robot.x).to eq(0)
        expect(robot.y).to eq(0)
      end
    end
  end
end
