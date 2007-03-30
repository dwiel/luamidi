require "luamidi"
require "luatimer"

-- luamidi.base1(true)

print(luamidi)
print(luamidi.getoutportcount())
print()
print(luamidi.getinportcount())
print()
table.foreach(luamidi.enumerateoutports(), print)
print()
table.foreach(luamidi.enumerateinports(), print)
-- out0 = luamidi.openout(0)
-- out0:noteOn(34)
-- port, note, [vel], [channel]
luamidi.noteOn(0, 34, 20, 2)

i = 0
while i < 500 do
	a, b, c, d = luamidi.getMessage(2)
	if a ~= nil then
		print(a, b, c, d)
	end
	luatimer.delayus(0)
	i = i + 1
end

luamidi.__gc()
