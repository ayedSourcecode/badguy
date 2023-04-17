--created with Super_Hugo's Stage Editor v1.6.3

function onCreate()

	makeAnimatedLuaSprite('obj1', 'background/sus/boom', -300, 0)
	setObjectOrder('obj1', 0)
	scaleObject('obj1', 2, 2)
	setScrollFactor('obj1', 0.5, 0.5)
	addAnimationByPrefix('obj1', 'anim', 'boom idle0', 24, false)
	playAnim('obj1', 'anim', true)
	addLuaSprite('obj1', true)
	
	makeLuaSprite('obj2', 'background/sus/hlam', -2223, -316)
	setObjectOrder('obj2', 1)
	scaleObject('obj2', 2, 2)
	setScrollFactor('obj2', 0.7, 0.7)
    setProperty('obj2.visible', false)
	addLuaSprite('obj2', true)
	
	makeLuaSprite('obj3', 'background/sus/gr', -3736, 558)
	setObjectOrder('obj3', 2)
	scaleObject('obj3', 2, 2)
    setProperty('obj3.visible', false)
	addLuaSprite('obj3', true)
	
	makeLuaSprite('obj4', 'background/sus/hlam2', 848, 550)
	setObjectOrder('obj4', 6)
    setProperty('obj4.visible', false)
	addLuaSprite('obj4', true)
	
	makeLuaSprite('obj5', 'background/sus/hlam3', 306, 769)
	setObjectOrder('obj5', 20)
	setScrollFactor('obj5', 1.5, 1.5)
    setProperty('obj5.visible', false)
	addLuaSprite('obj5', true)
	
	--makeAnimatedLuaSprite('obj6', 'background/sus/boom', -1348, 9206)
	--setObjectOrder('obj6', 4)
	--scaleObject('obj6', 2, 2)
	--setScrollFactor('obj6', 1.5, 1.5)
	--addAnimationByPrefix('obj6', 'anim', 'boom idle0', 24, false)
	--playAnim('obj6', 'anim', true)
	--addLuaSprite('obj6', true)
	
--	makeLuaSprite('obj22', 'background/sus/hlam', -2223, -316)
--	setObjectOrder('obj22', 1)
--	scaleObject('obj22', 2, 2)
--	setScrollFactor('obj22', 0.7, 0.7)
--	addLuaSprite('obj22', true)
--	
--	makeLuaSprite('obj32', 'background/sus/gr', -3736, 558)
--	setObjectOrder('obj32', 2)
--	scaleObject('obj32', 2, 2)
--	addLuaSprite('obj32', true)
--	
--	makeLuaSprite('obj42', 'background/sus/hlam2', 848, 550)
--	setObjectOrder('obj42', 6)
--	addLuaSprite('obj42', true)
--	
--	makeLuaSprite('obj52', 'background/sus/hlam3', 306, 769)
--	setObjectOrder('obj52', 20)
--	setScrollFactor('obj52', 1.5, 1.5)
--	addLuaSprite('obj52', true)
	
end

function onBeatHit()

	playAnim('obj1', 'anim', true)
	playAnim('obj6', 'anim', true)

end


function onUpdate()
	setProperty('gf.alpha', 0);
	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    if followchars == true then
        if mustHitSection == false then
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
        else
            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    end
end