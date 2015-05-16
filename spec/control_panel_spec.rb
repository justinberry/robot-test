require 'spec_helper'
require 'control_panel'
require 'robot'
require 'table'

describe 'control panel' do

  let(:table) { Table.new(10, 10) }
  let(:robot) { Robot.new }
  let(:control_panel) { ControlPanel.new(robot, table) }
  
  it 'places robot at location' do
    expect(robot.x).to eq(0)
    expect(robot.y).to eq(0)
    control_panel.place(1, 2, 'EAST') 
    expect(robot.x).to eq(1)
    expect(robot.y).to eq(2)
  end

  it 'sets direction of robot' do
    expect(robot.facing).to eq('NORTH')
    control_panel.place(1, 1, 'EAST') 
    expect(robot.facing).to eq('EAST')
  end

  it 'ignores placement of robot beyond width of the table' do
    control_panel.place(1, 0, 'EAST') 
    expect(robot.x).to eq(1)
    expect(robot.y).to eq(0)

    control_panel.place(10, 5, 'EAST') 

    expect(robot.x).to eq(1)
    expect(robot.y).to eq(0)
  end

  it 'ignores placement of robot beyond height of the table' do
    control_panel.place(0, 1, 'EAST')
    expect(robot.x).to eq(0)
    expect(robot.y).to eq(1)

    control_panel.place(5, 10, 'EAST')

    expect(robot.x).to eq(0)
    expect(robot.y).to eq(1)
  end

  it 'rotates robot 90 degrees left' do
    skip
  end

  it 'rotates robot 90 degrees right' do
    skip
  end

  it 'performs full rotations right' do
    skip
  end

  it 'performs full rotations right' do
    skip
  end

  it 'ignores commands that exceed width of the table' do
    skip
  end

  it 'ignores commands that exceed height of the table' do
    skip
  end

  it 'moves towards current facing' do
    skip
  end

end 
