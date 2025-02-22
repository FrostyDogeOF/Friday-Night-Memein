function onEvent(n, v1, v2)
	if string.lower(v1) == 'true' then
end
makeLuaSprite('whitebg', '', 0, 0)
	setScrollFactor('whitebg', 0, 0)
	makeGraphic('whitebg', 3840, 2160, '000000')
	addLuaSprite('whitebg', false)
	setProperty('whitebg.alpha', 0)
	screenCenter('whitebg', 'xy')

end
function onEvent(n, v1, v2)
	if string.lower(v1) == 'true' then
		doTweenAlpha('applebadxd69', 'whitebg', 1, v2, 'linear')
		doTweenColor('badapplexd6', 'healthBar', '000000', v2, 'linear')
		doTweenColor('badapplexd100', 'iconP1', '000000', v2, 'linear')
		doTweenColor('badapplexd10', 'iconP2', '000000', v2, 'linear')
	end
	if string.lower(v1) == 'false' then
		doTweenAlpha('applebadxd', 'whitebg', 0, v2, 'linear')
		doTweenColor('badapplexd3', 'boyfriend', 'cd1a21', v2, 'linear')
		doTweenColor('badapplexd4', 'dad', 'cea755', v2, 'linear')
		doTweenColor('badapplexd5', 'gf', 'FFFFFF', v2, 'linear')
		doTweenColor('badapplexd7', 'healthBar', 'FFFFFF', v2, 'linear')
		doTweenColor('badapplexd101', 'iconP1', 'cd1a21', v2, 'linear')
		doTweenColor('badapplexd11', 'iconP2', 'cea755', v2, 'linear')
	end
end