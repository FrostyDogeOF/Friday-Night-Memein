function onCreate()
    --variables
	Dodged = false;
    canDodge = false;
    DodgeTime = 0;
    precacheImage('warning');
	
	makeAnimatedLuaSprite('spacebar', 'warning', 10.35, -3.45);
    luaSpriteAddAnimationByPrefix('spacebar', 'spacebar', 'warning', 25, true);
	luaSpritePlayAnimation('spacebar', 'spacebar');
	setObjectCamera('spacebar', 'other');
    addLuaSprite('spacebar', true); 
    setProperty('spacebar.alpha', 0);
	
	makeAnimatedLuaSprite('fire', 'explosion', 135, -26);
   addAnimationByPrefix('fire', 'loop', 'EXPLOSION0', 24, false);
   setObjectCamera('fire','game')
   addLuaSprite('fire', false);
   scaleObject('fire', 1.6, 1.6)
   setProperty('fire.alpha', 0);
end

function onEvent(name, value1, value2)
    if name == "DodgeEventCyndaquil" then
    --Get Dodge time
	if trepDiff == 0 then
		DodgeTime = (value1+0.7);
	elseif trepDiff == 1 then
		DodgeTime = (value1+0.5);
	else
		DodgeTime = (value1);
	end
	
    --Make Dodge Sprite
	playSound("warning", 0.7)
	setProperty('spacebar.alpha', 0.7);
	--Set values so you can dodge
	canDodge = true;
	runTimer('Died', DodgeTime);
	
	end
end

function onUpdate()
   if canDodge == true and keyJustPressed('accept') then
   
   Dodged = true;
   canDodge = false
   
   end
end

function onTimerCompleted(tag, loops, loopsLeft)
   if tag == 'Died' and Dodged == false then
   setProperty('health', 0);
   
   elseif tag == 'Died' and Dodged == true then
   objectPlayAnimation('cyndaquil', 'attack', true);
   setProperty('fire.alpha', 1);
   objectPlayAnimation('fire', 'loop');
   playSound("boom", 0.7)
   
   characterPlayAnim('boyfriend', 'dodge', false);
   setProperty('boyfriend.specialAnim', true);
   cameraShake(game, 0.05, 0.4)
   setProperty('spacebar.alpha', 0);
   Dodged = false
   
   end
end