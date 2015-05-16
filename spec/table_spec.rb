require 'spec_helper'
require 'table'

describe 'table' do
  it 'throws exception for negative table width' do
    expect { Table.new(-1,1) }.to raise_error
  end

  it 'throws exception for negative table height' do
    expect { Table.new(1,-1) }.to raise_error
  end
end
