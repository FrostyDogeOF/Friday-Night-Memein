function onCreate()

    balls = false;

	makeAnimatedLuaSprite('fake cuphead3', 'characters/Cuphead Pissed', 0, 0)
	addAnimationByPrefix('fake cuphead3', 'shoot', 'DIE BITCH', 24, false)
	setProperty('fake cuphead3.y', getProperty('dad.y'))
	setProperty('fake cuphead3.x', getProperty('dad.x'))
	setProperty('fake cuphead3.scale.x', 1.5)
	setProperty('fake cuphead3.scale.y', 1.5)
	setProperty('fake cuphead3.alpha', 0)
	addLuaSprite('fake cuphead3', true)

    makeAnimatedLuaSprite('fake cuphead4', 'characters/Cuphead Pissed', 0, 0)
	addAnimationByPrefix('fake cuphead4', 'hurt', 'Ouch', 24, false)
	setProperty('fake cuphead4.y', getProperty('dad.y'))
	setProperty('fake cuphead4.x', getProperty('dad.x'))
	setProperty('fake cuphead4.scale.x', 1.5)
	setProperty('fake cuphead4.scale.y', 1.5)
	setProperty('fake cuphead4.alpha', 0)
	addLuaSprite('fake cuphead4', true)

    makeAnimatedLuaSprite('smol ball', 'bull/Cupheadshoot', getProperty('dad.x'), getProperty('dad.y'))
	addAnimationByPrefix('smol ball', 'idle', 'BulletFX_H-Tween_02 ', 48, true)
    setProperty('smol ball.offset.y', 230)
    setProperty('smol ball.offset.x', -350)
	addLuaSprite('smol ball', true)
    
    makeAnimatedLuaSprite('smol ball2', 'bull/Cupheadshoot', getProperty('dad.x'), getProperty('dad.y'))
	addAnimationByPrefix('smol ball2', 'idle', 'BulletFX_H-Tween_03 ', 48, true)
    setProperty('smol ball2.offset.y', 290)
    setProperty('smol ball2.offset.x', -350)
	addLuaSprite('smol ball2', true)

    makeAnimatedLuaSprite('smol burst', 'bull/Cupheadshoot', getProperty('dad.x'), getProperty('dad.y'))
	addAnimationByPrefix('smol burst', 'idle', 'BulletFlashFX', 24, true)
    setProperty('smol burst.offset.x', -320)
	addLuaSprite('smol burst', true)



    setProperty('smol ball.alpha', 0)
    setProperty('smol ball2.alpha', 0)
    setProperty('smol burst.alpha', 0)

end

function onEvent(name, value1, value2)

    if name == 'start attacking' then
        balls = true
    end
end

function onStepHit()
    if balls == true then
        setProperty('health', getProperty('health') - 0.1)
        objectPlayAnimation('smol ball', 'idle', false)
        objectPlayAnimation('smol ball2', 'idle', false)
        enemy = math.floor(math.random(1, 6));
        location = math.floor(math.random(1, 6));
        randomSoundFuncs[enemy]();
        soundFuncs[location]();
    end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
    if balls == true then
        setProperty('health', getProperty('health') - 0.025)
    end
end

function onUpdate()
    if balls == true then
        setProperty('smol ball.alpha', 1)
        setProperty('smol ball2.alpha', 1)
        setProperty('smol burst.alpha', 1)
        objectPlayAnimation('fake cuphead3', 'shoot', false)
        setProperty('dad.alpha', 0)
        setProperty('fake cuphead3.offset.x', 5)
        setProperty('fake cuphead3.offset.y', -12)
        setProperty('fake cuphead3.alpha', 1)
    end
    if getProperty('boyfriend.animation.curAnim.name') == 'attack' then
        setProperty('fake cuphead3.alpha', 0)
        balls = false;
    end

        if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SHIFT') and getProperty('boyfriend.animation.curAnim.name') == 'attack' then
            setProperty('smol ball.alpha', 0)
            setProperty('smol ball2.alpha', 0)
            setProperty('smol burst.alpha', 0)
            setProperty('dad.alpha', 1)
            setProperty('fake cuphead3.alpha', 0)
            setProperty('health', getProperty('health') + 0.5)
            runTimer('hurt', 0.23, 1)    
    end
    
end

function onTimerCompleted(tag, loops, loopsLeft)

    if tag == 'shoot' then
        setProperty('dad.alpha', 1)
        setProperty('fake cuphead3.alpha', 0)	
    end

    if tag == 'hurt' then
        objectPlayAnimation('fake cuphead4', 'hurt', false)
        playSound('hurt', 1)
        setProperty('fake cuphead4.offset.x', 112)
        setProperty('fake cuphead4.offset.y', -10)
        runTimer('b', 0.001, 1)
        runTimer('y', 0.7, 1)
    end

    if tag == 'y' then
        setProperty('dad.alpha', 1)
        setProperty('fake cuphead3.alpha', 0)
        setProperty('fake cuphead4.offset.x', 19990)
    end

    if tag == 'b' then
        setProperty('dad.alpha', 0)
        setProperty('fake cuphead3.alpha', 0)
        setProperty('fake cuphead4.alpha', 1)
    end
end


randomSoundFuncs = { --da climbing enemies
	[1] = function()
		soundFuncs = {
			[1] = function()
                playSound('pea0', 0.7)
			end,
			[2] = function()
                playSound('pea1', 0.7)
			end,
			[3] = function()
                playSound('pea2', 0.7)
			end,
            [4] = function()
                playSound('pea3', 0.7)
			end,
            [5] = function()
                playSound('pea4', 0.7)
			end,
            [6] = function()
                playSound('pea5', 0.7)
			end,
            
		}
	end,
	[2] = function()
		soundFuncs = {
			[1] = function()
                playSound('pea0', 0.7)
			end,
			[2] = function()
                playSound('pea1', 0.7)
			end,
			[3] = function()
                playSound('pea2', 0.7)
			end,
            [4] = function()
                playSound('pea3', 0.7)
			end,
            [5] = function()
                playSound('pea4', 0.7)
			end,
            [6] = function()
                playSound('pea5', 0.7)
			end,
		}
	end,
	[3] = function()
		soundFuncs = {
			[1] = function()
                playSound('pea0', 0.7)
			end,
			[2] = function()
                playSound('pea1', 0.7)
			end,
			[3] = function()
                playSound('pea2', 0.7)
			end,
            [4] = function()
                playSound('pea3', 0.7)
			end,
            [5] = function()
                playSound('pea4', 0.7)
			end,
            [6] = function()
                playSound('pea5', 0.7)
			end,
		}
	end,
    [4] = function()
		soundFuncs = {
			[1] = function()
                playSound('pea0', 0.7)
			end,
			[2] = function()
                playSound('pea1', 0.7)
			end,
			[3] = function()
                playSound('pea2', 0.7)
			end,
            [4] = function()
                playSound('pea3', 0.7)
			end,
            [5] = function()
                playSound('pea4', 0.7)
			end,
            [6] = function()
                playSound('pea5', 0.7)
			end,
		}
	end,
	[5] = function()
		soundFuncs = {
			[1] = function()
                playSound('pea0', 0.7)
			end,
			[2] = function()
                playSound('pea1', 0.7)
			end,
			[3] = function()
                playSound('pea2', 0.7)
			end,
            [4] = function()
                playSound('pea3', 0.7)
			end,
            [5] = function()
                playSound('pea4', 0.7)
			end,
            [6] = function()
                playSound('pea5', 0.7)
			end,
		}
	end,
	[6] = function()
		soundFuncs = {
			[1] = function()
                playSound('pea0', 0.7)
			end,
			[2] = function()
                playSound('pea1', 0.7)
			end,
			[3] = function()
                playSound('pea2', 0.7)
			end,
            [4] = function()
                playSound('pea3', 0.7)
			end,
            [5] = function()
                playSound('pea4', 0.7)
			end,
            [6] = function()
                playSound('pea5', 0.7)
			end,
		}
	end,

}
