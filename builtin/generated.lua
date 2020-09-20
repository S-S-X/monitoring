-- generated blocks (80x80)

local metric = monitoring.counter("mapgen_generated_count", "Generated mapgen count")

minetest.register_on_generated(function()
	-- increment chunk count metric
	metric.inc()

	-- assume 5 mapblock chunk length here
	monitoring.increment_total_mapblocks(125)
end)

minetest.register_chatcommand("monitoring_increment_generated_count", {
  description = "Increments the generated mapblock count metric",
  privs = { server = true },
  func = function(_, param)
		local count = tonumber(param)

		if count then
			local new_value = monitoring.increment_total_mapblocks(count)
			return true, "New total: " .. new_value
		end
  end
})
