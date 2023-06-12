if os.getenv("LOCAL_LUA_DEBUGGER_VSCODE") == "1" then
    require("lldebugger").start()
end

local Game = require "game"

local game

function love.load()
    local boardSize = 3 -- Set the board size (e.g., 3 for a 3x3 grid)
    local tileSize = 100 -- Set the tile size (e.g., 100 pixels)

    game = Game.new(boardSize, tileSize)
    game:load()
end

function love.update(dt)
    game:update(dt)
end

function love.draw()
    game:draw()
end

function love.mousepressed(x, y, button)
    if button == 1 then -- Left mouse button
        game:handleClick(x, y)
    end
end
