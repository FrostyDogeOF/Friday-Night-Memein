function onCreate()
    makeLuaSprite('room1', room1', -600, -300);
    setScrollFactor('room1', 1, 1);

    makeLuaSprite('room2', room2', -600, -300);
    setScrollFactor('room2', 1, 1);

    addLuaSprite('room', false);
    addLuaSprite('room', false);

    setProperty('room1.visible', true);
    setProperty('room2.visible', false);
end

function onEvent(name, value1, value2)
    if name == "Change Room" then
        if value1 == "1" then
           setProperty('room1.visible', true);
           setProperty('room2.visible', false);
        else if value1 == "2" then
           setProperty('room1.visible', false);
           setProperty('room2.visible', true);
        end
end