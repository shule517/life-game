#!/usr/bin/env ruby

def step(stage)
  neighbours = proc { |i,j|
    [[-1,0],[-1,1], [0,1],[1,1],[1,0],[1,-1],[0,-1],[-1,-1]]
      .map { |ioff, joff| [i + ioff, j+ joff] }
      .select { |i,j| i.between?(0,stage.size-1) && j.between?(0,stage[0].size-1) }
  }

  next_char = proc { |i,j|
    case stage[i][j]
    when ' ' # dead cell
      case neighbours.([i,j]).map { |i,j| stage[i][j] }.count("*")
      when 3
        '*'
      else
        ' '
      end
    when '*' # live cell
      case neighbours.([i,j]).map { |i,j| stage[i][j] }.count("*")
      when 0..1
        ' ' # dies
      when 2..3
        '*'
      when 4..8
        ' ' # overpopulation
      end
    end
  }

  stage = stage.map.with_index { |row, i|
    row.map.with_index { |_cell, j|
      next_char.(i, j)
    }
  }
  return stage
end

def show(stage)
  stage.each do |row|
    puts row.join
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

100.times do
  show(stage)
  stage = step(stage)
  puts '-'*79
  sleep 0.1
end
