class Board
  attr_reader :size 

  def initialize(n)
    @grid = Array.new(n) { Array.new(n, :N) }
    @size = n * n 
  end 

  def [](position)
    row, column = position 
    @grid[row][column]
  end

  def []=(position, value)
    row, column = position 
    @grid[row][column] = value 
  end

  def num_ships
    @grid.flatten.count { |ele| ele == :S }
  end

  def attack(position)
    if self[position] == :S 
      self[position] = :H
      puts "You sunk my battleship!"
      return true 
    else 
      self[position] = :X
      return false 
    end
  end
end