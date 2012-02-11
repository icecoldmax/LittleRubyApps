# @game = [
#     [0, 0, 0, 0, 0, 0, 0, 0, 0],
#     [0, 0, 0, 0, 0, 0, 0, 0, 0],
#     [0, 0, 0, 0, 0, 0, 0, 0, 0],
#     
#     [0, 0, 0, 0, 0, 0, 0, 0, 0],
#     [0, 0, 0, 0, 0, 0, 0, 0, 0],
#     [0, 0, 0, 0, 0, 0, 0, 0, 0],
#     
#     [0, 0, 0, 0, 0, 0, 0, 0, 0],
#     [0, 0, 0, 0, 0, 0, 0, 0, 0],
#     [0, 0, 0, 0, 0, 0, 0, 0, 0]
# ]


# @game = [
#     [9, 0, 0, 0, 2, 3, 1, 0, 5],
#     [1, 0, 3, 0, 6, 0, 2, 0, 0],
#     [0, 0, 0, 0, 9, 5, 0, 7, 3],
#     
#     [0, 0, 0, 0, 0, 1, 7, 0, 8],
#     [0, 9, 6, 0, 0, 0, 4, 5, 0],
#     [7, 0, 5, 8, 0, 0, 0, 0, 0],
#     
#     [6, 4, 0, 3, 8, 0, 0, 0, 0],
#     [0, 0, 1, 0, 7, 0, 9, 0, 6],
#     [5, 0, 2, 6, 1, 0, 0, 0, 4]
# ]

# easy
# @game = [
#     [0, 9, 2, 0, 0, 0, 0, 4, 0],
#     [6, 1, 0, 4, 0, 0, 0, 0, 5],
#     [3, 0, 0, 0, 9, 6, 1, 0, 8],
#     
#     [0, 0, 8, 0, 0, 2, 0, 5, 0],
#     [0, 2, 0, 7, 0, 5, 8, 0, 0],
#     [0, 4, 0, 0, 0, 3, 0, 9, 7],
#     
#     [0, 0, 6, 1, 0, 0, 7, 8, 0],
#     [4, 0, 0, 3, 0, 7, 5, 1, 0],
#     [2, 0, 1, 0, 0, 4, 6, 3, 9]
# ]


# expert
# @game = [
#     [7, 0, 1, 0, 0, 0, 2, 0, 5],
#     [0, 6, 5, 0, 0, 0, 8, 0, 0],
#     [0, 0, 0, 0, 1, 0, 9, 0, 0],
#     
#     [0, 0, 0, 0, 7, 6, 0, 0, 1],
#     [0, 0, 7, 0, 3, 0, 0, 6, 0],
#     [0, 0, 0, 2, 0, 0, 0, 0, 0],
#     
#     [0, 0, 3, 0, 6, 8, 0, 0, 0],
#     [0, 0, 0, 9, 0, 3, 0, 8, 0],
#     [0, 8, 0, 0, 5, 0, 0, 7, 0]
# ]

#expert
@game = [
    [0, 3, 0, 0, 0, 0, 0, 0, 0],
    [0, 0, 8, 0, 0, 0, 2, 3, 0],
    [0, 2, 0, 5, 1, 0, 0, 0, 6],
    
    [7, 0, 2, 0, 3, 0, 0, 0, 0],
    [0, 8, 0, 0, 0, 0, 0, 2, 0],
    [6, 0, 0, 9, 0, 5, 0, 0, 0],
    
    [0, 9, 0, 0, 0, 0, 7, 8, 1],
    [8, 0, 0, 0, 0, 6, 9, 0, 0],
    [0, 0, 1, 0, 0, 0, 0, 0, 0]
]

#hard
# @game = [
#     [0, 0, 0, 0, 9, 0, 0, 0, 0],
#     [5, 0, 0, 8, 4, 1, 0, 2, 0],
#     [7, 0, 0, 5, 0, 0, 0, 0, 0],
#     
#     [8, 0, 0, 6, 0, 2, 0, 0, 4],
#     [9, 0, 0, 0, 0, 0, 0, 7, 0],
#     [0, 5, 0, 0, 0, 0, 8, 6, 0],
#     
#     [0, 6, 0, 0, 0, 0, 0, 0, 0],
#     [4, 0, 0, 1, 7, 0, 0, 0, 0],
#     [1, 0, 7, 4, 6, 0, 2, 9, 0]
# ]

def show(matrix)
  matrix.map {|x| puts x.to_s }
  return nil
end


def get_rc(matrix, r, c)
  return matrix[r][c]
end

def find_next_zero(matrix)
 for i in 0...matrix.length
   for j in 0...matrix.length
     if get_rc(matrix, i, j) == 0
       return i,j
     end
   end
 end
return "finished","motherfucker!"
end

def find_next_zero_random(matrix)
  
  for j in 0...matrix.length
    i = rand(9)
    if get_rc(matrix, i, j) == 0
      return i,j
    end
  end
  return "finished","motherfucker!"  
end

def find_zeros_random(matrix)
  @zeros = []
  for i in 0...matrix.length
    for j in 0...matrix.length
      if get_rc(matrix, i, j) == 0
        @zeros << [i,j]
      end
    end
  end

end
   

def populate_boxes(matrix)
  
  @blocks = {} unless @blocks
  @blocks.clear if @blocks
  
  @blocks['tl'] = []
  @blocks['tm'] = []
  @blocks['tr'] = []
  @blocks['ml'] = []
  @blocks['mm'] = []
  @blocks['mr'] = []
  @blocks['bl'] = []
  @blocks['bm'] = []
  @blocks['br'] = []
      
  for i in 0..2
    for j in 0..2
      number = get_rc(matrix, i, j)
      @blocks['tl'] << number
    end
    
    for j in 3..5
      number = get_rc(matrix, i, j)
      @blocks['tm'] << number

    end
    for j in 6..8
      number = get_rc(matrix, i, j)
      @blocks['tr'] << number
    end
  end

  for i in 3..5
    for j in 0..2
      number = get_rc(matrix, i, j)
      @blocks['ml'] << number
    end
    for j in 3..5
      number = get_rc(matrix, i, j)
      @blocks['mm'] << number
    end
    for j in 6..8
      number = get_rc(matrix, i, j)
      @blocks['mr'] << number
    end
  end

  for i in 6..8
    for j in 0..2
      number = get_rc(matrix, i, j)
      @blocks['bl'] << number
    end
    for j in 3..5
      number = get_rc(matrix, i, j)
      @blocks['bm'] << number
    end
    for j in 6..8
      number = get_rc(matrix, i, j)
      @blocks['br'] << number
    end
  end
  
end

def find_block(matrix, row, col)
  string = ""
  if (0..2) === row
    string += 't'
  elsif (3..5) === row
    string += 'm'
  elsif (6..8) === row
    string += 'b'
  else
    puts "Bad value for row in find_block"
  end
  
  if (0..2) === col
    string += 'l'
  elsif (3..5) === col
    string += 'm'
  elsif (6..8) === col
    string += 'r'
  else
    puts "Bad value for column in find_block"
  end
  return string     
end

# is X in things tests 

def is_x_in_row(matrix, row, x)
  if matrix[row].include?(x)
    # puts "#{x} is in row #{row}"
    return true
  else
    # puts "#{x} is NOT in row #{row}"
  end
end

def is_x_in_col(matrix, col, x)
  for i in matrix
    if i[col] == x
      return true
    end
  end
  return false
end

def is_x_in_box(matrix, row, col, x)
  xblock = find_block(matrix, row, col)
  return @blocks[xblock].include?(x)
end

def is_ok(matrix, row, col, x)
  unless is_x_in_row(matrix, row, x) || is_x_in_col(matrix, col, x) || is_x_in_box(matrix, row, col, x)
    return true
  else
    return false
  end
end

@fill_in_run_times = 0
@depth = 0

@runs_at_zero_depth_times = 0

def fill_in(matrix, depth, row, col)

  if depth > @depth
    @depth = depth
  end
 @fill_in_run_times += 1
  for x in (1..9)
    if depth == 0
      @runs_at_zero_depth_times += 1
    end
    if is_ok(matrix, row, col, x)
      # puts "#{x} tests as OK in row #{row} column #{col}"
      matrix[row][col] = x
      populate_boxes(matrix)
      @finished_test = find_next_zero(matrix)
      unless @finished_test[0] == "finished"
        if fill_in(matrix, depth+1, *find_next_zero(matrix))
          return true
        else
          matrix[row][col] = 0
          populate_boxes(matrix)
        end
      else
        return true
      end
    end
  end
  
return false
end

def solve(matrix)
  time_at_start = Time.new
populate_boxes(matrix)
r,c = find_next_zero(matrix)
  if fill_in(matrix, 0, r, c)
    time_at_end = Time.new
    puts
    puts "--------------------------"
    puts "|                         |"
    puts "|      Sudoku Solver!     |"
    puts "|                         |"
    puts "--------------------------"
    show(matrix)
    puts "--------------------------"
    puts "|                         |"
    puts "|      By David Nettle    |"
    puts "|                         |"
    puts "--------------------------"
    puts 
    puts "------ fill_in ran #{@fill_in_run_times} times ------"
    puts "------ Depth: #{@depth} ------"
    puts "------ Runs at 0 depth: #{@runs_at_zero_depth_times} ------"
    puts "------ Time: #{time_at_end - time_at_start} seconds ------"
  end
end

def solve_random(matrix)
populate_boxes(matrix)
r,c = find_next_zero_random(matrix)
  if fill_in_random(matrix, 0, r, c)
    puts
    puts "----------------------------"
    puts "|                          |"
    puts "|      Sudoku Solver!      |"
    puts "|                          |"
    puts "----------------------------"
    show(matrix)
    puts "----------------------------"
    puts "|                          |"
    puts "|      By David Nettle     |"
    puts "|                          |"
    puts "----------------------------"
    puts 
    puts "------ fill_in ran #{@fill_in_run_times} times ------"
    puts "------ Depth: #{@depth} ------"
    puts "------ Runs at 0 depth: #{@runs_at_zero_depth_times} ------"
  end
end

def fill_in_random(matrix, depth, row, col)

  if depth > @depth
    @depth = depth
  end
 @fill_in_run_times += 1
  for x in (1..9)
    if depth == 0
      @runs_at_zero_depth_times += 1
      puts "Depth back to 0. (#{@runs_at_zero_depth_times})"
    end
    if is_ok(matrix, row, col, x)
      # puts "#{x} tests as OK in row #{row} column #{col}"
      matrix[row][col] = x
      populate_boxes(matrix)
      @finished_test = find_next_zero_random(matrix)
      unless @finished_test[0] == "finished"
        if fill_in_random(matrix, depth+1, *find_next_zero_random(matrix))
          return true
        else
          matrix[row][col] = 0
          populate_boxes(matrix)
        end
      else
        return true
      end
    end
  end
  
return false
end
