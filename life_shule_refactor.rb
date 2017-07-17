#!/usr/bin/env ruby

class LifeGame
  def initialize(stage)
    @stage = stage
  end

  def at(i, j)
    @stage[i][j]
  end

  def width
    @stage.first.size
  end

  def height
    @stage.size
  end

  def neighbours(i, j)
    [-1,0,1].product([-1,0,1]) - [[0,0]]
      .map { |ioff, joff| [i + ioff, j + joff] }
      .select { |i, j| i.between?(0, height - 1) && j.between?(0, width - 1) }
  end

  def neighbours_alive_count(i, j)
    neighbours(i, j).map { |i, j| at(i, j) }.count('*')
  end

  def next_char(i, j)
    case at(i, j)
    when ' ' # dead cell
      case neighbours_alive_count(i, j)
      when 3
        '*'
      else
        ' '
      end
    when '*' # live cell
      case neighbours_alive_count(i, j)
      when 0..1
        ' ' # dies
      when 2..3
        '*'
      when 4..8
        ' ' # overpopulation
      end
    end
  end

  def step
    @stage = @stage.map.with_index { |row, i|
      row.map.with_index { |_cell, j|
        next_char(i, j)
      }
    }
  end

  def show
    @stage.each do |row|
      puts row.join
    end
  end
end

stage = \
["                                                                                ",
"                                           ******                               ",
"                                           *********                  ***       ",
"                                           *********                     ***    ",
"                                        ***************         ***      ***    ",
"                                     ***   ************            ***   ****** ",
"                               ******      ************      ***   ***      *** ",
"                            ***         ***   *********               ***   *** ",
"                         ***            ***   *********         ***   ***   *** ",
"                   ******               ***   ************      ***   ***   *** ",
"          ************                  ***      *********      ***   ***   *** ",
"          ************                     ***   *********      ***   ***   *** ",
" ***   ***************                     ***   *********      ***   ***   *** ",
" ***   ***************                        ************                  *** ",
" ***   ***************                        ************                      ",
"    *********************************         ************                      ",
"             ************            ******************                         ",
"                *********                           ***                         ",
"                   ******                                                       ",
"                   *********                                                    ",
"                   *********                                                    ",
"                   *********                                                    ",
"                      ******                                                    ",
"                                                                                "]
.map { |line| [*line.each_char] }
life_game = LifeGame.new(stage)
100.times do
  life_game.show
  life_game.step
  puts '-'*79
  sleep 0.1
end
