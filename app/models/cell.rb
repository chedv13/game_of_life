class Cell
  attr_reader :row, :col, :universe
  attr_accessor :alive

  def initialize(universe, row, col, alive = false)
    @universe, @row, @col, @alive,  = universe, row, col, alive
  end

  def dead?
    !@alive
  end

  def dead!
    @alive = false
  end

  def live?
    @alive
  end

  def live!
    @alive = true
  end

  # Изменение состояния клетки
  def toggle!
    @alive = !@alive
  end

  # Нахождение соседей
  def neighbours
    height = @universe.height
    width = @universe.width

    neighbours = []

    neighbours.push(@universe.cells[self.row - 1][self.col - 1])
    neighbours.push(@universe.cells[self.row - 1][self.col])
    neighbours.push(@universe.cells[self.row - 1][(self.col + 1) % height])
    neighbours.push(@universe.cells[self.row][(self.col + 1) % height])
    neighbours.push(@universe.cells[(self.row + 1) % width][(self.col + 1) % height])
    neighbours.push(@universe.cells[(self.row + 1) % width][self.col])
    neighbours.push(@universe.cells[(self.row + 1) % width][self.col - 1])
    neighbours.push(@universe.cells[self.row][self.col - 1])

    neighbours
  end

  # Нахождение всех живых соседей
  def live_neighbours
    self.neighbours.select do |neighbour|
      neighbour && neighbour.alive
    end
  end
end