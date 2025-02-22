function onCreate()
	makeLuaSprite('bar1','sans-extra/bar1',0,-150)
    setObjectCamera('bar1','hud')
    addLuaSprite('bar1',false)

    makeLuaSprite('bar2','sans-extra/bar2',0,150)
    setObjectCamera('bar2','hud')
    addLuaSprite('bar2', false)
end

function onEvent(n,one,two)
	if n == 'BlackBars' then
		if one == 'true' then
			doTweenY('bar1tween','bar1',0,0.1,'QuartOut')
       		doTweenY('bar2tween','bar2',0,0.1,'QuartOut')
		end
		if one == 'false' then
			doTweenY('bar1tween','bar1',-150,0.1,'QuartOut')
       		doTweenY('bar2tween','bar2',150,0.1,'QuartOut')
		end
	end
end