require '../models/cell'
require '../models/universe'

class UniverseController
  def self.play(filename, number_of_steps)
    if filename.nil?
      raise 'Пожалуйста! Задайте имя файла.'
    elsif number_of_steps.nil?
      raise 'Пожалуйста! Задайте количество шагов игры.'
    else
      universe = Universe.new(filename)
      steps = []
      number_of_steps.times do |i|
        steps << universe.next_generation!.cells.map do |row|
          row.map { |cell| cell.live? ? 1 : 0 }.join(',')
        end
      end
      steps
    end
  end
end

