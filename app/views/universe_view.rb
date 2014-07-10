require '../controllers/universe_controller'

steps = UniverseController.play(ARGV[0], ARGV[1].to_i)

steps.each_with_index do |step, idx|
  puts "STEP #{idx}"

  step.each do |row|
    puts row
  end
end