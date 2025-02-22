function onCreate()
    --variables
	Attack = false;
    canAttack = false;
    AttackTime = 0;


        makeAnimatedLuaSprite('fake bf2', 'characters/Boyfriend_Rain', 0, 0)
        addAnimationByPrefix('fake bf2', 'attack', '0BF attack', 24, false)
        setProperty('fake bf2.y', getProperty('boyfriend.y'))
        setProperty('fake bf2.x', getProperty('boyfriend.x'))
        setProperty('fake bf2.alpha', 0)
        addLuaSprite('fake bf2', true)
end

function onEvent(name, value1, value2)
    if name == "DodgeEvent2" then
    --Get Attack time
    AttackTime = (value1);
		
	--Set values so you can Attack
	canAttack = true;
	runTimer('Died2', AttackTime);
	
	end
end

function onUpdate()
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