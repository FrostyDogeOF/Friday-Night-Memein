function onEvent(name, value1, value2)

 if name == 'readu' then

  makeLuaSprite('countdownready', 'ready',262,178)

  setObjectCamera('countdownready', 'hud')

  addLuaSprite('countdownready', true)

  doTweenAlpha('readyend','countdownready',0,crochet/1000,'cubeInOut')
 end


end
