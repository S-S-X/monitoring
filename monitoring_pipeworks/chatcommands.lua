minetest.register_chatcommand("pipeworks_flush", {
        description = "flushes the pipeworks tubes",
        privs = {server=true},
        func = function(name)
                minetest.log("warning", "Player " .. name .. " flushes the pipeworks tubes")
                local count = 0
                for _, entity in pairs(pipeworks.luaentity.entities) do
                        entity:remove()
                        count = count + 1
                end
                minetest.log("warning", "Flushed: " .. count .. " items")
                return true, "Flushed: " .. count .. " items"
        end
})

minetest.register_chatcommand("pipeworks_stats", {
        description = "Returns some pipeworks stats",
        privs = {interact=true},
        func = function()
                local count = 0
                for _, _ in pairs(pipeworks.luaentity.entities) do
                        count = count + 1
                end
                return true, "Items in tubes: " .. count
        end
})
