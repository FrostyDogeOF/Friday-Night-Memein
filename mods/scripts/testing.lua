function onUpdate()

    setProperty('healthBar.visible', false)
    setProperty('iconP2.y', 100)
    setProperty('healthBar.x', -100)
    getProperty('iconP1.x')
    setProperty('iconP1.x', -300)
    setPropertyFromGroup('opponentStrums', i, 'y',550);
    setPropertyFromGroup('opponentStrums', 1, 'y',550);
    setPropertyFromGroup('opponentStrums', 2, 'y',550);
    setPropertyFromGroup('opponentStrums', 3, 'y',550);
end

function onUpdatePost(delta)
    setProperty('iconP1.x',1000)
    iconP2.x = 930
end