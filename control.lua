--
-- Factorio: Spawner alert mod
-- File: control.lua
-- Date: 25/08/2020 23:49:03
-- Author: Ish (persoishtar@gmail.com)
-- --------------------------------------
-- http://www.opensource.org/licenses/MIT
-- MIT License
-- 
-- Copyright (c) 2020 Ish
-- 
-- Permission is hereby granted, free of charge, to any person obtaining a copy of
-- this software and associated documentation files (the "Software"), to deal in
-- the Software without restriction, including without limitation the rights to
-- use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
-- of the Software, and to permit persons to whom the Software is furnished to do
-- so, subject to the following conditions:
-- 
-- The above copyright notice and this permission notice shall be included in all
-- copies or substantial portions of the Software.
-- 
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
-- IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
-- FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
-- AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
-- LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
-- OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
-- SOFTWARE.
--
local input_control_name = "spawner-alert-toggle"
local players_toggle_state = {}

-- -------------------------------------------------------------------------- --
--                                  Handlers                                  --
-- -------------------------------------------------------------------------- --

function toggle_alert(event)
    local player = game.get_player(event.player_index)

    -- toggle alert switch
    players_toggle_state[player.index] =
        not (players_toggle_state[player.index])

    player.print(
        "Spawner alert status: " ..
            (players_toggle_state[player.index] and 'enabled' or 'disabled'),
        {r = 1, g = 0.2, b = 0.2}
    )
end

function check_and_alert(event)
    -- compute total number of pollution consumption by spawners
    local stats_to_fetch = {
        name = "spitter-spawner",
        input = false,
        precision_index = defines.flow_precision_index.one_second,
        count = true
    }

    local spitter_count = game.pollution_statistics.get_flow_count(
                              stats_to_fetch
                          )

    stats_to_fetch.name = "biter-spawner"
    local biter_count = game.pollution_statistics.get_flow_count(stats_to_fetch)
    local pollution_count_per_sec =
        math.floor((spitter_count + biter_count) / 5)

    -- alert players if alert is enabled
    if pollution_count_per_sec > 0 then
        local players = game.players

        for _, player in pairs(players) do
            if (players_toggle_state[player.index]) then
                player.add_custom_alert(
                    player.character, {type = "item", name = "gun-turret"},
                    "Spawners are consuming " .. pollution_count_per_sec ..
                        " pollution/s.", true
                )
            end
        end
    end
end

-- -------------------------------------------------------------------------- --
--                                   Events                                   --
-- -------------------------------------------------------------------------- --

script.on_event(input_control_name, toggle_alert)
script.on_nth_tick(60, check_and_alert)
