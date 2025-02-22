function onUpdate(elapsed)
songPos = getSongPosition()
local currentBeat = (songPos/5000)*(curBpm/20)
local currentBeat1 = (songPos/5000)*(curBpm/25)
local currentBeat2 = (songPos/5000)*(curBpm/30)
local currentBeat3 = (songPos/5000)*(curBpm/35)
local BonusSpeed = (songPos/4500)*(currentBeat/2000)*(currentBeat1/2000)*(currentBeat2/2000)*(currentBeat3/2000)
local YIntensity = 50 + getProperty('songMisses')
local XIntensity = 50 + getProperty('songMisses')*(2)
        
        noteTweenY('Playerfour', 4, defaultPlayerStrumY0 + (YIntensity) * math.sin((currentBeat) + math.sin((BonusSpeed)) * math.pi), 2)
        noteTweenY('Playerfive', 5, defaultPlayerStrumY1 + (YIntensity) * math.sin((currentBeat1) + math.sin((BonusSpeed)) * math.pi), 1)
        noteTweenY('Playersix', 6, defaultPlayerStrumY2 + (YIntensity) * math.sin((currentBeat2) + math.sin((BonusSpeed)) * math.pi), 1)
        noteTweenY('Playerseven', 7, defaultPlayerStrumY3 + (YIntensity) * math.sin((currentBeat3) + math.sin((BonusSpeed)) * math.pi), 2)


        noteTweenX(defaultPlayerStrumX0, 4, defaultPlayerStrumX0 + (XIntensity)*math.sin((currentBeat+4*0.25)*math.pi), 2)
	noteTweenX(defaultPlayerStrumX1, 5, defaultPlayerStrumX1 + (XIntensity) + 20*math.sin((currentBeat3+8*0.25)*math.pi), 1)
	noteTweenX(defaultPlayerStrumX2, 6, defaultPlayerStrumX2 + (XIntensity)*math.sin((currentBeat2+4*0.25)*math.pi), 1)
	noteTweenX(defaultPlayerStrumX3, 7, defaultPlayerStrumX3 + (XIntensity) + 20*math.sin((currentBeat1+8*0.25)*math.pi), 2)


        noteTweenY('OpponentOne', 0, defaultOpponentStrumY0 + (YIntensity) * math.sin((currentBeat) + math.sin((BonusSpeed)) * math.pi), 1)
        noteTweenY('OpponentTwo', 1, defaultOpponentStrumY1 + (YIntensity) * math.sin((currentBeat3) + math.sin((BonusSpeed)) * math.pi), 2)
        noteTweenY('OpponentThree', 2, defaultOpponentStrumY2 + (YIntensity) * math.sin((currentBeat2) + math.sin((BonusSpeed)) * math.pi), 1)
        noteTweenY('OpponentFour', 3, defaultOpponentStrumY3 + (YIntensity) * math.sin((currentBeat1) + math.sin((BonusSpeed)) * math.pi), 2)


        noteTweenX(defaultOpponentStrumX0, 0, defaultOpponentStrumX0 + (XIntensity)*math.sin((currentBeat3+4*0.25)*math.pi), 2)
	noteTweenX(defaultOpponentStrumX1, 1, defaultOpponentStrumX1 + (XIntensity) - 20*math.sin((currentBeat2+8*0.25)*math.pi), 2)
	noteTweenX(defaultOpponentStrumX2, 2, defaultOpponentStrumX2 + (XIntensity)*math.sin((currentBeat1+4*0.25)*math.pi), 1)
	noteTweenX(defaultOpponentStrumX3, 3, defaultOpponentStrumX3 + (XIntensity) - 20*math.sin((currentBeat+8*0.25)*math.pi), 1)

end
