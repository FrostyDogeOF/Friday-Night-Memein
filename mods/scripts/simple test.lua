function onUpdate(elapsed)
    if keyboardPressed('O') then
    
    triggerEvent('Add Camera Zoom', 0.03, 0.03)
    makeLuaText('text', "restarting...",100,200,200)
    addLuaText('text',true)
    runTimer('Delay', 1, 1)
    loadSong()
    end
end