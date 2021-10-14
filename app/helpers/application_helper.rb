module ApplicationHelper

  def generate_board(game)
    mines = game.mines.collect{|m| [m.x,m.y]}
    cols = [*1..game.width]
    rows = [*1..game.height]
    rows.map do |row|
      tag.div class: "box-tile" do
        cols.map do |col|
          tag.div class: "d-inline-flex flex-nowrap me-2 tile" do
            if mines.include?([col,row])
              tag.i class: "fas fa-bomb"
            else
              tag.i class: "fas fa-square"
            end
          end
        end.join.html_safe
      end
    end.join
  end
end
