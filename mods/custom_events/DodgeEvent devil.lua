function onCreate()

    makeAnimatedLuaSprite('hadokenNM', 'bull/NMcupheadAttacks', 0, 0)
	addAnimationByPrefix('hadokenNM', 'BIG BALL', 'DeathBlast', 24, true)
	setProperty('hadokenNM.y', getProperty('dad.y') + 100)
	setProperty('hadokenNM.x', getProperty('dad.x') - 350)
    setProperty('hadokenNM.alpha', 0.9)
    setProperty('hadokenNM.scale.x', 1.2)
    setProperty('hadokenNM.scale.y', 1.2)



    if songName == 'Devils-Gambit-Nm' then
        makeAnimatedLuaSprite('fake bf', 'characters/nightmare-bf', 0, 0)
        addAnimationByPrefix('fake bf', 'dodge', 'BF NOTE DOWN', 24, false)
        setProperty('fake bf.y', getProperty('boyfriend.y'))
        setProperty('fake bf.x', getProperty('boyfriend.x'))
        setProperty('fake bf.alpha', 0)
        addLuaSprite('fake bf', true)
    else
        makeAnimatedLuaSprite('fake bf', 'characters/BoyFriend_NM', 0, 0)
        addAnimationByPrefix('fake bf', 'dodge', 'boyfriend dodge', 24, false)
        addAnimationByPrefix('fake bf', 'attack', '0BF attack', 24, false)
        setProperty('fake bf.y', getProperty('boyfriend.y'))
        setProperty('fake bf.x', getProperty('boyfriend.x'))
        setProperty('fake bf.alpha', 0)
        addLuaSprite('fake bf', true)
    end


    --variables
    Dodged = false;
    canDodge = false;
    canAnimate = false
    DodgeTime = 0;

    Attack = false;
    canAttack = false;
    AttackTime = 0;
end

function onEvent(name, value1, value2)
    if name == "DodgeEvent devil" then
    --Get Dodge time
    DodgeTime = 0.6;

    canAnimate = true

    --Set values so you can dodge
    canDodge = true;
    runTimer('Died', DodgeTime);

    runTimer('doevent devil', 0.3, 1)
    canDodge = true;
    Dodged = false

    end
end

function onUpdate()

    if canDodge == true and keyJustPressed('space') then
        objectPlayAnimation('dodgebutton', 'dodgeclick')
        Dodged = true;
        canDodge = false        
    end

    if canDodge == true and canAnimate == true then
        objectPlayAnimation('fake cuphead7', 'shootdown', false)
        triggerEvent('Camera Follow Pos', 500, 1060)
        setProperty('fake cuphead7.offset.x', 47)
        setProperty('fake cuphead7.offset.y', -81)
        objectPlayAnimation('dad', 'attack', false)
        setProperty('dad.offset.x', 312)
        setProperty('dad.offset.y', 246)
        triggerEvent('DodgeEvent', 0.5, '')
        runTimer('camfollowback', 1.1, 1)
        setProperty('dad.alpha', 0)
        setProperty('fake cuphead7.alpha', 1)
        runTimer('normal', 0.2, 1)
        runTimer('hadokenNM', 0.3, 1)
        playSound('pre_shoot', 1)
        canAnimate = false
    end
        
                if canAttack == true and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SHIFT') then
                        objectPlayAnimation('fake bf2', 'attack', false)
                        setProperty('fake bf2.offset.x', 1090)
                        setProperty('fake bf2.offset.y', -10)
                        setProperty('boyfriend.alpha', 0)
                        setProperty('fake bf2.alpha', 1)
                        runTimer('attack', 1, 1)
                    Attack = true;
                    canAttack = false  
    end

end

function onTimerCompleted(tag, loops, loopsLeft)

    if tag == 'doevent devil' then
        runTimer('dodge devil', 0.4, 1)
    end

    if tag == 'dodge devil' then
            playSound('Dodged', 0.7);

        
            objectPlayAnimation('fake bf', 'dodge', false)
            if songName == 'Devils-Gambit-Nm' then
                setProperty('fake bf.offset.x', -132)
                setProperty('fake bf.offset.y', -132)
            else
                setProperty('fake bf.offset.x', 20)
                setProperty('fake bf.offset.y', -6)
            end
            setProperty('boyfriend.alpha', 0)
            setProperty('fake bf.alpha', 1)
            runTimer('appear2', 1, 1)
            playSound('pre_shoot', 1)


        canDodge = false
    end

    if tag == 'Died' and Dodged == false then
    setProperty('health', 0);

    elseif tag == 'Died' and Dodged == true then
    Dodged = false
    end

    --if tag == 'hadokenNM' then
		--addLuaSprite('hadokenNM', true)
		--doTweenX('flyNM', 'hadokenNM', 3000, 2, 'linear')
		--runTimer('backNM', 2.2, 1)
        --playSound('shoot', 1)
    --end

    --if t == 'backNM' then
		--removeLuaSprite('hadokenNM', false)
		--doTweenX('flyNM', 'hadokenNM', getProperty('dad.x') - 350, 0.001, 'linear')
	--end

    if tag == 'camfollowback' then
        triggerEvent('Camera Follow Pos', '', '')
    end


	if tag == 'hadokenNM' then
		addLuaSprite('hadokenNM', true)
		doTweenX('flyNM', 'hadokenNM', 3000, 2, 'linear')
		runTimer('backNM', 2.2, 1)
		playSound('shoot', 1)
	end

	if tag == 'backNM' then
		removeLuaSprite('hadokenNM', false)
		doTweenX('flyNM', 'hadokenNM', getProperty('dad.x') - 350, 0.001, 'linear')
	end


    if tag == 'normal' then
        setProperty('dad.alpha', 1)
        setProperty('fake cuphead7.alpha', 0)
    end

    if tag == 'appear2' then
            setProperty('boyfriend.alpha', 1)
            setProperty('fake bf.alpha', 0)
        end

        if tag == 'Died2' and Attack == false then
            
            elseif tag == 'Died2' and Attack == true then
            Attack = false
            end
       
        if tag == 'hurt' then
    
        end
    
        if tag == 'attack' then
            setProperty('boyfriend.alpha', 1)
            setProperty('fake bf2.alpha', 0)	
        end
end