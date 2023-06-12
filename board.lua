local Board = {}
Board.__index = Board

function Board.new()
    local board = setmetatable({}, Board)
    board.grid = {}
    board.cellSize = 100
    board.margin = 10
    board:reset()
    return board
end

function Board:reset()
    -- Initialize an empty grid
    for row = 1, 3 do
        self.grid[row] = {}
        for col = 1, 3 do
            self.grid[row][col] = nil
        end
    end
end

function Board:draw()
    for row = 1, 3 do
        for col = 1, 3 do
            local x = (col - 1) * (self.cellSize + self.margin)
            local y = (row - 1) * (self.cellSize + self.margin)

            -- Draw each cell
            love.graphics.rectangle("line", x, y, self.cellSize, self.cellSize)

            -- Draw player symbol if cell is occupied
            local symbol = self.grid[row][col]
            if symbol then
                love.graphics.print(symbol, x + self.cellSize / 2, y + self.cellSize / 2)
            end
        end
    end
end

return Board
