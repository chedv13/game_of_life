require './app/models/cell'
require './app/models/universe'

describe Cell do
  let(:universe) { Universe.new }

  it 'belongs to a universe' do
    cell = Cell.new(universe, 0, 0)
    cell.universe == universe
  end

  it 'initializes with row and col in the world' do
    cell = Cell.new(universe, 0, 1)
    expect(cell.row).to eq(0)
    expect(cell.col).to eq(1)
  end

  it 'initializes as dead' do
    cell = Cell.new(universe, 0, 0)
    expect(cell).to be_dead
    expect(cell).not_to be_live
  end

  it 'should be set as dead' do
    cell = Cell.new(universe, 0, 0)
    cell.live!
    cell.dead!
    expect(cell).to be_dead
    expect(cell).not_to be_live
  end

  it 'should toggle between live and dead' do
    cell = Cell.new(universe, 0, 0)
    cell.toggle!
    expect(cell).to be_live
    cell.toggle!
    expect(cell).to be_dead
  end
end