require 'spec_helper'
require 'robot'

describe 'robot' do
  let(:robot) { Robot.new }

  it 'has initial position of 0,0' do
    expect(robot.x).to eq(0)
    expect(robot.y).to eq(0)
  end
end
