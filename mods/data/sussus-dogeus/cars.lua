local cars = {}
local carCount = 1
local dodging = false
local canDodge = true

function onCarCreated(car)
    local spawnShift = 125
    setProperty(tostring(car.sprite..".x"),getProperty(tostring(car.sprite..".x"))+spawnShift)
    doTweenX(tostring(car.sprite.."spawnTween"),car.sprite,getProperty(tostring(car.sprite..".x"))-spawnShift,2,"quadOut")
end

function createCar()
    local spritename = tostring("car"..carCount)
    local x = getProperty("boyfriend.x")
    local y = -175
    makeAnimatedLuaSprite(spritename,"street/car",x,y)
    setObjectOrder(spritename,getObjectOrder('boyfriendGroup')-1)
    setProperty(tostring(spritename..".antialiasing"),false)
    scaleObject(spritename,12,12)
    addAnimationByPrefix(spritename,"idle","idle",16,true)
    playAnim(spritename,"idle",true)
    addLuaSprite(spritename)
    local cardata = {
        sprite = spritename,
        hitbeat = curBeat + 2,
        dodged = false,
        speedy = 600,
                }
    table.insert(cars,cardata)
    onCarCreated(cardata)
    -- debugPrint("Cat spawned")
    carCount = carCount + 1
end

function updateCars(elapsed)
    for i,car in ipairs(cars) do
        setProperty(tostring(car.sprite..".y"),getProperty(tostring(car.sprite..".y"))+car.speedy*elapsed)
    end
end

function onBeatHit()
    for i,car in ipairs(cars) do
        if curBeat == car.hitbeat and not car.dodged then
            -- debugPrint(car.hitbeat)
            car.dodged = true
            if not dodging then
                addHealth(-0.2)
                playAnim("boyfriend","hurt",true)
            else
                debugPrint("Dodged Car!")
            end
            table.remove(cars,i)
            table.insert(cars,i,car)
        end
    end
end

function dodge()
    if not dodging and canDodge then
        -- debugPrint("Dodged!")
        dodging = true
        canDodge = false
        
        runTimer("dodge",0.3)
        runTimer("dodgeCooldown",0.6)
    end
end

function onUpdate(elapsed)
    updateCars(elapsed)
    if dodging then
        playAnim("boyfriend","dodge",true)
    end
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SPACE') then
        dodge()
    end
end

function onSectionHit()
    createCar()
end

function onTimerCompleted(tag)
    if tag == "dodge" then
        dodging = false
    elseif tag == "dodgeCooldown" then
        canDodge = true
    end
end