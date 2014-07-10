require './app/models/universe'

describe Universe do
  it 'initialize' do
    world = Universe.new
    expect(world.cells.length).to eq(0)
  end
end
