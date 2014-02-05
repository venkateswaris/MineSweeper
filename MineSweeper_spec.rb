require './MineSweeper.rb'
describe MineSweeper do
  mine_sweeper = MineSweeper.new
  it 'should create mineSweeper grid' do
    size = 3
    mine_sweeper.create(size);

    sweeper_grid = mine_sweeper.GetMineSweeperGrid();
    sweeper_grid.length.should eq size
  end

  it 'should set mine in the grid' do
    size = 3
    xcor = 1
    ycor = 1
    mine_sweeper.create(size)
    mine_sweeper.MarkMine(xcor, ycor)

    sweeper_grid = mine_sweeper.GetMineSweeperGrid()
    sweeper_grid[xcor][ycor].should eq -1
  end

  it 'should calculate Adjacent mine' do
    size = 3
    xcor = 1
    ycor = 1
    mine_sweeper.create(size)
    mine_sweeper.MarkMine(xcor-1,ycor);
    adjacent_mine = mine_sweeper.calculateNoOfAdjacentMine(xcor, ycor)
    adjacent_mine.should eq 1
  end

  it 'should end game If you clicked mine' do
    size = 3
    xcor = 1
    ycor = 1
    mine_sweeper.create(size)
    mine_sweeper.MarkMine(xcor,ycor);

    shouldContinueGame = mine_sweeper.open(xcor, ycor)
    shouldContinueGame.should eq false
  end

  it 'should not end game If you clicked normal tile' do
    size = 3
    xcor = 1
    ycor = 1
    mine_sweeper.create(size)
    mine_sweeper.MarkMine(xcor-1,ycor);

    shouldContinueGame = mine_sweeper.open(xcor, ycor)
    shouldContinueGame.should eq true
  end
end

