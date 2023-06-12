local Player = {}
Player.__index = Player

function Player.new(symbol)
    local player = setmetatable({}, Player)
    player.symbol = symbol
    return player
end

return Player