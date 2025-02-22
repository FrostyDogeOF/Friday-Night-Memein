function onEvent(name, value1, value2)
	if curStep >= 3 and curStep < 8347665 then
		songPos = getSongPosition()
		local currentBeat = (songPos/5000)*(curBpm/60)
		doTweenX('opponentmove3', 'dad', 100 - 190*math.sin((currentBeat+34*9)*math.pi), 2)
	end
end