require "./MineSweeper.rb"
class Game
  mine_sweeper = MineSweeper.new
  puts "Enter minesweeper size";
  size = gets.chomp();
  mine_sweeper.create(Integer(size));
  mine_sweeper.printMine();

  puts "Enter Mine positions";
  mine_sweeper.MarkMine(1,1);
  mine_sweeper.MarkMine(2,1);
  mine_sweeper.printMine();

  puts "Start Play Game..";

  begin
    mine_sweeper.printMine();
    $xInput = Integer(gets.chomp());
    $yInput = Integer(gets.chomp());
  end while (mine_sweeper.open($xInput, $yInput))
end
