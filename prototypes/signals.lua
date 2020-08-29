--
-- Factorio: Spawner alert mod
-- File: signals.lua
-- Date: 29/08/2020 18:59:22
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

data:extend(
    {
        {
            type = "item-subgroup",
            name = "spawner-alert-signal",
            group = "signals"
        },
        {
            type = "fluid",
            name = "spawner-alert-icon",
            icon = "__spawner-alert__/graphics/icons/biter_nest.png",
            icon_size = 128,
            icon_mipmaps = 0,
            default_temperature = 15,
            max_temperature = 100,
            heat_capacity = "0.2KJ",
            base_color = {r = 0, g = 0, b = 0},
            flow_color = {r = 0, g = 0, b = 0},
            hidden = true,
            auto_barrel = false,
            subgroup = "spawner-alert-signal"
        }
    }
)
