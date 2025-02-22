-- Event notes hooks
function onEvent(name, value1, value2)
	if name == 'CreditsText' then
		makeLuaSprite('credit', 'creditcards/'.. songName, -1024, 64)
		setObjectCamera('credit', 'hud');
		addLuaSprite('credit', true)
		
		doTweenX('scrollIn', 'credit', 0, 0.7, 'circOut')
		runTimer('scrolled', 4)
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'scrolled' then
		doTweenX('scrollOut', 'credit', -1024, 0.7, 'circIn')
	end
end

function onTweenCompleted(tag)
	if tag == 'scrollOut' then
		removeLuaSprite('credit')
	end
end