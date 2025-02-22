function onUpdate(elapsed)
	songPos = getSongPosition()
	local currentBeat = (songPos/3000)*(curBpm/18)
		doTweenY('opponentmove3', 'dad', 100 - 190*math.sin((currentBeat+34*9)*math.pi), 2)
end