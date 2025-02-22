function onCreate()


	makeAnimatedLuaSprite('fake cuphead7', 'characters/Nightmare_Cuphead', 0, 0)
	addAnimationByPrefix('fake cuphead7', 'shoot', 'Beamm', 24, false)
    addAnimationByPrefix('fake cuphead7', 'shootdown', 'ShootDown', 24, false)
	setProperty('fake cuphead7.y', getProperty('dad.y'))
	setProperty('fake cuphead7.x', getProperty('dad.x'))
	setProperty('fake cuphead7.scale.x', 1.5)
	setProperty('fake cuphead7.scale.y', 1.5)
	setProperty('fake cuphead7.alpha', 0)
	addLuaSprite('fake cuphead7', true)

    makeAnimatedLuaSprite('fake cuphead8', 'characters/Nightmare_Cuphead', 0, 0)
	addAnimationByPrefix('fake cuphead8', 'hurt', 'Dodgez', 24, false)
	setProperty('fake cuphead8.y', getProperty('dad.y'))
	setProperty('fake cuphead8.x', getProperty('dad.x'))
	setProperty('fake cuphead8.scale.x', 1.5)
	setProperty('fake cuphead8.scale.y', 1.5)
	setProperty('fake cuphead8.alpha', 0)
	addLuaSprite('fake cuphead8', true)

    makeAnimatedLuaSprite('smol ball devil', 'bull/NMcupheadBull', getProperty('dad.x'), getProperty('dad.y'))
	addAnimationByPrefix('smol ball devil', 'idle', 'Shot01', 24, true)
    setProperty('smol ball devil.offset.y', -100)
    setProperty('smol ball devil.offset.x', -1000000)
    setProperty('smol ball devil.scale.x', 1.5)
    setProperty('smol ball devil.scale.y', 1.1)
    
    makeAnimatedLuaSprite('smol ball2 devil', 'bull/NMcupheadBull', getProperty('dad.x'), getProperty('dad.y'))
	addAnimationByPrefix('smol ball2 devil', 'idle', 'Shot02', 24, true)
    setProperty('smol ball2 devil.offset.y', -100)
    setProperty('smol ball2 devil.offset.x', -1000000)
    setProperty('smol ball2 devil.scale.x', 1.5)
    setProperty('smol ball2 devil.scale.y', 1.1)

    makeAnimatedLuaSprite('smol burst devil', 'bull/NMcupheadBull', getProperty('dad.x'), getProperty('dad.y'))
	addAnimationByPrefix('smol burst devil', 'idle', 'Shot03', 24, true)
    setProperty('smol burst devil.offset.x', -1000000)
    setProperty('smol burst devil.scale.x', 1.5)
    setProperty('smol burst devil.scale.y', 1.1)




end

function onEvent(name, value1, value2)

    if name == 'start attacking devil' then
        shoot = true
    end
end

function onStepHit()
    if shoot == true then
        health = getProperty('health')

        if curStep % 6 == 0 then
            addLuaSprite('smol ball devil', true)
            objectPlayAnimation('smol burst devil', 'idle', true)
        end

        if curStep % 5 == 0 then
            addLuaSprite('smol ball2 devil', true)
            objectPlayAnimation('smol ball2 devil', 'idle', true)
        end

        if curStep % 4 == 0 then
            addLuaSprite('smol burst devil', true)
            objectPlayAnimation('smol ball devil', 'idle', true)
        end

        setProperty('health', getProperty('health') - 0.05)
        enemy = math.floor(math.random(1, 6));
        location = math.floor(math.random(1, 6));
        randomSoundFuncs[enemy]();
        soundFuncs[location]();
    end
end


function onSongStart()
    setProperty('smol ball devil.offset.x', -350)
    setProperty('smol ball2 devil.offset.x', -350)
    setProperty('smol burst devil.offset.x', -320)

    setProperty('smol ball devil.alpha', 0)
    setProperty('smol ball2 devil.alpha', 0)
    setProperty('smol burst devil.alpha', 0)
end


function goodNoteHit(id, direction, noteType, isSustainNote)


    if shoot == true then
        setProperty('health', getProperty('health') - 0.02)
    end
end

function onUpdate()
    if shoot == true then


        objectPlayAnimation('fake cuphead7', 'shoot', false)
        setProperty('dad.alpha', 0)
        setProperty('fake cuphead7.offset.x', -22)
        setProperty('fake cuphead7.offset.y', -248)
        setProperty('smol ball devil.alpha', 1)
        setProperty('smol ball2 devil.alpha', 1)
        setProperty('smol burst devil.alpha', 1)
        setProperty('fake cuphead7.alpha', 1)
    end
    if getProperty('boyfriend.animation.curAnim.name') == 'attack' then
        setProperty('fake cuphead7.alpha', 0)
        shoot = false;
    end

    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SHIFT') and getProperty('boyfriend.animation.curAnim.name') == 'attack' then
        setProperty('smol ball devil.alpha', 0)
        setProperty('smol ball2 devil.alpha', 0)
        setProperty('smol burst devil.alpha', 0)    
        setProperty('dad.alpha', 1)
        setProperty('fake cuphead7.alpha', 0)
        setProperty('health', getProperty('health') + 0.5)
        runTimer('hurt', 0.23, 1)
        end
    
end

function onTimerCompleted(tag, loops, loopsLeft)

    if tag == 'shoot' then
        setProperty('dad.alpha', 1)
        setProperty('fake cuphead7.alpha', 0)	
    end

    if tag == 'hurt' then
        objectPlayAnimation('fake cuphead8', 'hurt', false)
        playSound('hurt', 1)
        setProperty('fake cuphead8.offset.x', 80)
        setProperty('fake cuphead8.offset.y', -107)
        runTimer('b', 0.001, 1)
        runTimer('y', 0.7, 1)
    end

    if tag == 'y' then
        setProperty('dad.alpha', 1)
        setProperty('fake cuphead7.alpha', 0)
        setProperty('fake cuphead8.offset.x', 19990)
    end

    if tag == 'b' then
        setProperty('dad.alpha', 0)
        setProperty('fake cuphead7.alpha', 0)
        setProperty('fake cuphead8.alpha', 1)
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
