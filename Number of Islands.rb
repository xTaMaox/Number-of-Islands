def num_islands(grid)
  return 0 if grid.empty?
  
  directions = [[1,0], [0,1], [-1,0], [0,-1]]
  queue = []
  number_of_islands = 0
  
  grid.each_with_index do |row, i|
    row.each_with_index do |box, y|
      next if box == '0'
      queue << [i, y]
      number_of_islands += 1
      while queue.any?
        x, y = queue.shift
        directions.each do |direction|
          new_x = x + direction[0]
          new_y = y + direction[1]
          if new_x >= 0 && new_x < grid.size && new_y >= 0 && new_y < grid[0].size && grid[new_x][new_y] == '1'
            queue << [new_x, new_y]
            grid[new_x][new_y] = '0'
          end
        end
      end
    end
  end
  number_of_islands
end