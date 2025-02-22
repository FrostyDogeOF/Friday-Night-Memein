function onUpdate(elapsed)
songPos = getSongPosition()
local currentBeat = (songPos/3000)*(curBpm/18)

        noteTweenY('a', 4, defaultPlayerStrumY0 - 120*math.sin((currentBeat+4*2.25)*math.pi), 0.3)
        noteTweenY('b', 5, defaultPlayerStrumY1 - 400*math.sin((currentBeat+5*10.25)*math.pi), 0.9)
        noteTweenY('c', 6, defaultPlayerStrumY2 - 780*math.sin((currentBeat+6*3.25)*math.pi), 2.6)
        noteTweenY('d', 7, defaultPlayerStrumY3 - 340*math.sin((currentBeat+7*40.25)*math.pi), 6.6)

        noteTweenY('e', 0, defaultOpponentStrumY0 + 2000*math.sin((currentBeat+4*0.75)*math.pi), 3.6)
        noteTweenY('f', 1, defaultOpponentStrumY1 + 180*math.sin((currentBeat+5*1.25)*math.pi), 1.6)
        noteTweenY('g', 2, defaultOpponentStrumY2 + 130*math.sin((currentBeat+6*20.25)*math.pi), 0.6)
        noteTweenY('h', 3, defaultOpponentStrumY3 + 200*math.sin((currentBeat+7*0.30)*math.pi), 42.6)

        noteTweenX(defaultPlayerStrumX0, 4, defaultPlayerStrumX0 - 380*math.sin((currentBeat-4*0.25)*math.pi), 5.6)
        noteTweenX(defaultPlayerStrumX1, 5, defaultPlayerStrumX1 - 780*math.sin((currentBeat-5*0.25)*math.pi), 2.6)
        noteTweenX(defaultPlayerStrumX2, 6, defaultPlayerStrumX2 - 140*math.sin((currentBeat-6*0.25)*math.pi), 0.3)
        noteTweenX(defaultPlayerStrumX3, 7, defaultPlayerStrumX3 - 180*math.sin((currentBeat-7*0.25)*math.pi), 5.4)

        noteTweenX(defaultOpponentStrumX0, 0, defaultOpponentStrumX0 - 300*math.sin((currentBeat-12*2.25)*math.pi), 0.6)
        noteTweenX(defaultOpponentStrumX1, 1, defaultOpponentStrumX1 - 280*math.sin((currentBeat-3*0.85)*math.pi), 5.6)
        noteTweenX(defaultOpponentStrumX2, 2, defaultOpponentStrumX2 - 380*math.sin((currentBeat-9*5.25)*math.pi), 2.6)
        noteTweenX(defaultOpponentStrumX3, 3, defaultOpponentStrumX3 - 180*math.sin((currentBeat-6*7.25)*math.pi), 0.23)
end