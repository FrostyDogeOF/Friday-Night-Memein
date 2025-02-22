function onUpdate(elapsed)
	if curStep >= 0 and curStep < 30 then
		songPos = getSongPosition()
		local currentBeat = (songPos/5000)*(curBpm/250)

		noteTweenX(defaultPlayerStrumX0, 4, defaultPlayerStrumX0 - -350*math.sin((currentBeat+4*2)*math.pi), 0.5)

		noteTweenX(defaultPlayerStrumX1, 5, defaultPlayerStrumX1 - -150*math.sin((currentBeat+14*2)*math.pi), 0.5)

		noteTweenX(defaultPlayerStrumX2, 6, defaultPlayerStrumX2 - 150*math.sin((currentBeat+4*2)*math.pi), 0.5)

		noteTweenX(defaultPlayerStrumX3, 7, defaultPlayerStrumX3 - 350*math.sin((currentBeat+14*2)*math.pi), 0.5)


         end

end