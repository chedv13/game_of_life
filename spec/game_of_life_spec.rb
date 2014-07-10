require './app/models/cell'
require './app/models/universe'

describe 'Game of Life' do
  let(:universe) { Universe.new('./spec/data/universe.txt') }

  context 'live cell' do
    it '(with no live neighbours)' do
      cell = universe.cells[0][0]
      cell.live!
      universe.next_generation!
      expect(cell).to be_dead
    end

    it '(with one live neighbours)' do
      cell = universe.cells[0][0]
      cell.live!

      neighbour_cell = universe.cells[0][1]
      neighbour_cell.live!

      universe.next_generation!
      expect(cell).to be_dead
      expect(neighbour_cell).to be_dead
    end
  end

  context 'live cell' do
    it '(with two live neighbours)' do
      cell = universe.cells[2][2]
      cell.live!

      cell_at_left = universe.cells[2][1]
      cell_at_left.live!

      cell_at_right = universe.cells[2][3]
      cell_at_right.live!

      universe.next_generation!
      expect(cell).to be_live
      expect(cell_at_left).to be_dead
      expect(cell_at_right).to be_dead
    end

    it '(with three live neighbours)' do
      cell = universe.cells[2][2]
      cell.live!

      cell_at_left = universe.cells[1][2]
      cell_at_left.live!

      cell_at_right = universe.cells[3][2]
      cell_at_right.live!

      cell_at_bottom = universe.cells[2][3]
      cell_at_bottom.live!

      universe.next_generation!
      expect(cell).to be_live
      expect(cell_at_left).to be_live
      expect(cell_at_right).to be_live
      expect(cell_at_bottom).to be_live
    end
  end
end
