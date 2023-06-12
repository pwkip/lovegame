local Game = {}

function Game.new(boardSize, tileSize)
    local game = setmetatable({}, { __index = Game })
    game.boardSize = boardSize
    game.tileSize = tileSize
    game.currentPlayer = 1
    game.board = {}

    for row = 1, boardSize do
        game.board[row] = {}
        for col = 1, boardSize do
            game.board[row][col] = 0
        end
    end

    return game
end

function Game:load()
    -- Load any game-specific resources or initialize variables
end

function Game:update(dt)
    -- Update game logic based on the elapsed time (dt)
end

function Game:draw()
    -- Clear the screen
    love.graphics.clear()

    -- Draw the grid
    local gridSize = self.boardSize * self.tileSize
    love.graphics.setColor(1, 1, 1)
    for row = 1, self.boardSize do
        for col = 1, self.boardSize do
            local x = (col - 1) * self.tileSize
            local y = (row - 1) * self.tileSize

            love.graphics.rectangle("line", x, y, self.tileSize, self.tileSize)

            local mark = self.board[row][col]
            if mark == 1 then
                love.graphics.line(x + 10, y + 10, x + self.tileSize - 10, y + self.tileSize - 10)
                love.graphics.line(x + self.tileSize - 10, y + 10, x + 10, y + self.tileSize - 10)
            elseif mark == 2 then
                love.graphics.circle("line", x + self.tileSize / 2, y + self.tileSize / 2, self.tileSize / 2 - 10)
            end
        end
    end
end

function Game:handleClick(x, y)
    local row = math.floor(y / self.tileSize) + 1
    local col = math.floor(x / self.tileSize) + 1

    if row >= 1 and row <= self.boardSize and col >= 1 and col <= self.boardSize then
        if self.board[row][col] == 0 then
            self.board[row][col] = self.currentPlayer
            self.currentPlayer = self.currentPlayer == 1 and 2 or 1
        end
    end
end

return Game
