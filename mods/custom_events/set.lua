function onEvent(name, value1, value2)

 if name == 'set' then

  makeLuaSprite('countdownset', 'set',289,199)

  setObjectCamera('countdownset', 'hud')

  addLuaSprite('countdownset', true)

  doTweenAlpha('setend','countdownset',0,crochet/1000,'cubeInOut')

end
end