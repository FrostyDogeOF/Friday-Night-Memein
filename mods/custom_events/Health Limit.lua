showLimit = true -- set to false to disable limit mark on health bar
healthLimit = 2
local gainValue
local limiterPos
local timerCompleted

function onCreatePost()
    gainValue = getProperty('healthGain')
    if showLimit then
        makeLuaSprite('limiter', '', screenWidth / 2, 0)
        makeGraphic('limiter', 4, getProperty('healthBar.height'), '000000')
        setObjectCamera('limiter', 'hud')
        setObjectOrder('limiter', getObjectOrder('iconP2') - 1)
        setProperty('limiter.alpha', 0)
        addLuaSprite('limiter', false)
    end
end

function onEvent(name, value1, value2)
        healthLimit = tonumber(value1)
        timerCompleted = false

        if healthLimit < getHealth() then -- i decided not to include free health option in the event, but if you still need it, remove this and the 37th line
            if tonumber(value2) > 0 then
                if stringStartsWith(version, '0.7') then
                    startTween('haxeClone', 'this', {health = tonumber(value1)}, tonumber(value2), {ease = 'sineInOut'})
                else
                    runHaxeCode([[
                        FlxTween.tween(game, {health: ]]..tonumber(value1)..[[}, ]]..tonumber(value2)..[[, {ease: FlxEase.sineInOut});
                    ]])
                    runTimer('haxeClone', tonumber(value2))
end
            else
                setHealth(healthLimit)
        end -- here

        if showLimit then
            limiterPos = getProperty("healthBar.x") + getProperty("healthBar.width") - getProperty("limiter.width") + healthLimit * 2 - healthLimit * (getProperty("healthBar.width") / 2) -- thx h4mster
            if tonumber(value2) > 0 then
                doTweenX('limiterTweenX', 'limiter', limiterPos, tonumber(value2), 'sineInOut')
                doTweenAlpha('limiterTweenAlpha', 'limiter', 1, tonumber(value2), 'sineInOut')
            else
                setProperty('limiter.alpha', 1)
                setProperty('limiter.x', limiterPos)
            end
        end

        if tonumber(value1) == 0 and not practice then
            debugPrint('congratulations you successfully killed yourself') 
        end
    end
end

function onUpdatePost(elapsed) -- garbage
    setProperty('limiter.y', getProperty('healthBar.y'))
    setProperty('limiter.angle', getProperty('healthBar.angle'))
    setProperty('limiter.scale.x', getProperty('healthBar.scale.x'))
    setProperty('limiter.scale.y', getProperty('healthBar.scale.y'))
    if getProperty('healthBar.alpha') ~= 1 then 
        setProperty('limiter.alpha', getProperty('healthBar.alpha'))
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'haxeClone' then
        timerCompleted = true
    end
end

function goodNoteHit()
    if getHealth() > healthLimit then
        setHealth(healthLimit)
        if timerCompleted then
            setProperty('healthGain', 0)
        end
    else
        setProperty('healthGain', gainValue)
    end
    --debugPrint(healthLimit .. ' ' .. getHealth())
end