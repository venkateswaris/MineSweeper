class MineSweeper
  $grid = Array.new ;
  MINEVALUE = -1
  UNOPENEDINDEX = -2

  def GetMineSweeperGrid
    return $grid;
  end

  def create(size)
    $grid = Array.new(size) {|i| Array.new(size) {|i| UNOPENEDINDEX} }
  end

  def printMine()
    size = $grid.length
    for i in 0..size-1
      for j in 0..size-1
      if($grid[i][j] != UNOPENEDINDEX && $grid[i][j] != MINEVALUE)
        print($grid[i][j])
      else
        print('X');
      end
      end
      puts ;
    end
  end

  def MarkMine(xcor,ycor)
     $grid[xcor][ycor] = MINEVALUE;
  end

  def printValue(value)
    print value;
    $stdout.flush();
  end

  def open(xcor,ycor)
    if($grid[xcor][ycor] == MINEVALUE)
      puts "Oops!... you clicked mine..."
      return false;
    end
    $grid[xcor][ycor] = calculateNoOfAdjacentMine(xcor,ycor)
    return true;
  end

  def calculateNoOfAdjacentMine(xcor,ycor)
    noOfMine = 0
    if(CheckValidLocation(xcor,ycor-1) && $grid[xcor][ycor-1] == MINEVALUE)
      noOfMine = noOfMine +1
    end
    if(CheckValidLocation(xcor,ycor+1) && $grid[xcor][ycor+1] == MINEVALUE)
      noOfMine = noOfMine +1
    end
    if(CheckValidLocation(xcor-1,ycor) && $grid[xcor-1][ycor] == MINEVALUE)
      noOfMine = noOfMine +1
    end
    if(CheckValidLocation(xcor+1,ycor) && $grid[xcor+1][ycor] == MINEVALUE)
      noOfMine = noOfMine +1
    end
    return noOfMine;
  end

  def CheckValidLocation(xcor,ycor)
    return xcor >=0 && xcor < $grid.length && ycor >=0 && ycor < $grid.length
  end
end


