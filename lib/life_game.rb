# Dir.glob('./lib/**/*.rb').tap { |file| puts file }.each { |f| require f }
# class LifeGame
#   def start
#     world = WorldGenerator.new.generate_random(10, 20)
#     loop do
#       puts world.to_s
#       world.next
#       gets
#     end
#   end
# end

# LifeGame.new.start
