require 'rspec'
require_relative 'solve'

describe 'part 1' do
  it 'calculates potions needed for Ancient Ant' do
    expect(part1('A')).to eq(0)
  end

  it 'calculates potions needed for Badass Beetle' do
    expect(part1('B')).to eq(1)
  end

  it 'calculates potions needed for Creepy Cockroach' do
    expect(part1('C')).to eq(3)
  end

  it 'works with given example' do
    expect(part1('ABBAC')).to eq(5)
  end
end

describe 'part 2' do
  it 'calculates potions needed for Diabolical Dragonfly' do
    expect(part2('D')).to eq(5)
  end

  it 'needs one more potion per creature when they form a pair' do
    expect(part2('AA')).to eq(2)
  end

  it 'works with given example' do
    expect(part2('AxBCDDCAxD')).to eq(28)
  end
end

describe 'part 3' do
  it 'needs one more potion per creature when they form a pair' do
    expect(part3('AA')).to eq(2)
    expect(part3('AAx')).to eq(2)
  end

  it 'needs two more potions per creature when they form a trio' do
    expect(part3('AAA')).to eq(6)
  end

  it 'works with given example' do
    expect(part3('xBxAAABCDxCC')).to eq(30)
  end
end
