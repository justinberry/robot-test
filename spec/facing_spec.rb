require 'spec_helper'
require 'mover'

describe 'facing' do
  let(:facing) { Facing.new }

  describe '#current_direction' do
    it 'returns current direction' do
      expect(facing.current_direction).to equal(Facing::NORTH)
    end
  end

  describe '#update' do
    it 'updates direction' do
      expect(facing.current_direction).to equal(Facing::NORTH)
      facing.update(Facing::EAST)
      expect(facing.current_direction).to equal(Facing::EAST) 
    end

  end

  describe '#turn_left' do
    it 'performs full rotation left' do
      expect(facing.current_direction).to eq(Facing::NORTH)
      facing.turn_left()
      expect(facing.current_direction).to eq(Facing::WEST)
      facing.turn_left()
      expect(facing.current_direction).to eq(Facing::SOUTH)
      facing.turn_left()
      expect(facing.current_direction).to eq(Facing::EAST)
      facing.turn_left()
      expect(facing.current_direction).to eq(Facing::NORTH)
    end     
  end

  describe '#turn_right' do
    it 'performs full rotation right' do
      expect(facing.current_direction).to equal(Facing::NORTH)
      facing.turn_right()
      expect(facing.current_direction).to equal(Facing::EAST)
      facing.turn_right()
      expect(facing.current_direction).to equal(Facing::SOUTH)
      facing.turn_right()
      expect(facing.current_direction).to equal(Facing::WEST)
      facing.turn_right()
      expect(facing.current_direction).to equal(Facing::NORTH)
    end    
  end
end
