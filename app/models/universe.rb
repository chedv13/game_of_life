class Universe
  attr_accessor :cells

  def initialize(filename = nil)
    @cells = if  filename
               begin
                 init_array = File.open(filename).each_line.map do |line|
                   line.split(',').map { |x| x.strip.to_i % 2 }
                 end
               rescue
                 raise 'Файл отсутствует!'
               end

               min_row_length = init_array.min { |row1, row2| row1.length <=> row2.length }.length
               init_array = init_array.map { |row| row[0..min_row_length - 1] }

               init_array.each_with_index.map do |row, row_idx|
                 row.each_with_index.map do |col, col_idx|
                   Cell.new(self, row_idx, col_idx, (col == 1 ? true : false))
                 end
               end
             else
               []
             end
  end

  # Вычисление высоты поля
  def height
    @cells.length
  end

  # Вычисление ширины поля
  def width
    @cells[0].length
  end

  # Вычислеие следущего поколения
  def next_generation!
    copy_cells = @cells.map { |x| x.map { |y| [y.alive, y.live_neighbours.length] } }

    self.cells = @cells.each_with_index.map do |row, row_idx|
      row.each_with_index.map do |cell, cell_idx|
        copy_cell = copy_cells[row_idx][cell_idx]

        if copy_cell[0]
          if copy_cell[1] < 2 || copy_cell[1] > 3
            cell.alive = false
          end

          cell
        else
          if copy_cell[1] == 3
            cell.alive = true
          end

          cell
        end
      end
    end

    self
  end
end