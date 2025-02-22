local cuptext = false

function onEvent(name,v1,v2)
	if name == 'Text' then

		makeLuaText('text', v1, 400, 430, 300)
		addLuaText('text')
		setTextSize('text', 50)

		if v2 == 'Cuphead' then
			cuptext = true
		end

		if cuptext == true then
			setTextSize('text', 100)

			setTextFont('text', 'ZillaSlabBold.ttf')
			setProperty('text.x', 450)
		end
	end
end