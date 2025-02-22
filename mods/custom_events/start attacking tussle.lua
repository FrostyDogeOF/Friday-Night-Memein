function onCreate()

    balls = false;

	makeAnimatedLuaSprite('fake cuphead5', 'characters/Cuphead_Remastered', 0, 0)
	addAnimationByPrefix('fake cuphead5', 'shoot', 'Shoot', 24, false)
	setProperty('fake cuphead5.y', getProperty('dad.y'))
	setProperty('fake cuphead5.x', getProperty('dad.x'))
	setProperty('fake cuphead5.scale.x', 1.5)
	setProperty('fake cuphead5.scale.y', 1.5)
	setProperty('fake cuphead5.alpha', 0)
	addLuaSprite('fake cuphead5', true)

    makeAnimatedLuaSprite('fake cuphead6', 'characters/Cuphead_Remastered', 0, 0)
	addAnimationByPrefix('fake cuphead6', 'hurt', 'Hurt', 24, false)
	setProperty('fake cuphead6.y', getProperty('dad.y'))
	setProperty('fake cuphead6.x', getProperty('dad.x'))
	setProperty('fake cuphead6.scale.x', 1.5)
	setProperty('fake cuphead6.scale.y', 1.5)
	setProperty('fake cuphead6.alpha', 0)
	addLuaSprite('fake cuphead6', true)

    makeAnimatedLuaSprite('smol ball', 'bull/Cupheadshoot', getProperty('dad.x'), getProperty('dad.y'))
	addAnimationByPrefix('smol ball', 'idle', 'BulletFX_H-Tween_02 ', 48, true)
    setProperty('smol ball.offset.y', 230)
    setProperty('smol ball.offset.x', -350)
	addLuaSprite('smol ball', true)
    
    makeAnimatedLuaSprite('smol ball2', 'bull/Cupheadshoot', getProperty('dad.x'), getProperty('dad.y'))
	addAnimationByPrefix('smol ball2', 'idle', 'BulletFX_H-Tween_03 ', 48, true)
    setProperty('smol ball2.offset.y', 230)
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

    if name == 'start attacking tussle' then
        balls = true
    end
end

function onStepHit()
    if balls == true then
        health = getProperty('health')
        if health < 1.1 then
            setProperty('health', getProperty('health') - 0.05)
        elseif health < 1 then
            setProperty('health', getProperty('health') - 0.07)
        elseif health < 0.8 then
            setProperty('health', getProperty('health') - 0.1)
        else
            setProperty('health', getProperty('health') - 0.02)
        end
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
        objectPlayAnimation('fake cuphead5', 'shoot', false)
        setProperty('dad.alpha', 0)
        setProperty('fake cuphead5.offset.x', 5)
        setProperty('fake cuphead5.offset.y', -12)
        setProperty('fake cuphead5.alpha', 1)
    end
    if getProperty('boyfriend.animation.curAnim.name') == 'attack' then
        setProperty('fake cuphead5.alpha', 0)
        balls = false;
    end

    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SHIFT') and getProperty('boyfriend.animation.curAnim.name') == 'attack' then
        setProperty('smol ball.alpha', 0)
        setProperty('smol ball2.alpha', 0)
        setProperty('smol burst.alpha', 0)
        setProperty('dad.alpha', 1)
        setProperty('fake cuphead5.alpha', 0)
        setProperty('health', getProperty('health') + 0.5)
        runTimer('hurt', 0.23, 1)
        end
    
end

function onTimerCompleted(tag, loops, loopsLeft)

    if tag == 'shoot' then
        setProperty('dad.alpha', 1)
        setProperty('fake cuphead5.alpha', 0)	
    end

    if tag == 'hurt' then
        objectPlayAnimation('fake cuphead6', 'hurt', false)
        playSound('hurt', 1)
        setProperty('fake cuphead6.offset.x', 206)
        setProperty('fake cuphead6.offset.y', 101)
        runTimer('b', 0.001, 1)
        runTimer('y', 0.7, 1)
    end

    if tag == 'y' then
        setProperty('dad.alpha', 1)
        setProperty('fake cuphead5.alpha', 0)
        setProperty('fake cuphead6.offset.x', 19990)
    end

    if tag == 'b' then
        setProperty('dad.alpha', 0)
        setProperty('fake cuphead5.alpha', 0)
        setProperty('fake cuphead6.alpha', 1)
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
