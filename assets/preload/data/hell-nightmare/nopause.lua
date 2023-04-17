-- Script made by Aaltadis! Credit me, if u used this in a mod :)

-- INSTRUCTIONS TO USE IT:
-- 1. Take the "pauseasset" image from "images" folder in my zip archive. (if you want to customize it)
-- 2. Put this script in mods/scripts  or mods/urmod/scripts
-- 3. If you followed these instruction, it should work. IF IT DOESNT, then dm me on discord (which is below) so i could fix it
-- discord: Tail (nobody)#8333

-- Credits:
-- Uhard (i stole hide health bar and hud code from his jellybean mod)

function onPause()
    runTimer('pauseremove', 1.5);
    makeLuaSprite('pausesprite', 'pauseasset', -360, -120); --wow... offsets matter!??!?!
    --setObject('pausesprite', 1.5, 1.5);
    setScrollFactor('pausesprite', 0, 0);
    addLuaSprite('pausesprite', true);
    --health bar invisible (no way!!!!!)
    setProperty('healthBar.visible', false);
    setProperty('healthBarBG.visible', false);
    setProperty('iconP1.visible', false);
    setProperty('iconP2.visible', false);
    --this should make arrows being invisible
    setProperty('playerStrums.visible', false);
    --hides fucking HUD
    doTweenAlpha('hudalpha', 'camHUD', 0, 0.01, 'linear');
    return Function_Stop;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'pauseremove' then -- Timer completed, delete pause sprite
		removeLuaSprite('pausesprite', true); --delets sprite with tag "pausesprite"
        --thing below should make health bar visible again
        setProperty('healthBar.visible', true);
        setProperty('healthBarBG.visible', true);
        --and this makes arrows go visible again
        doTweenAlpha('hudalpha', 'camHUD', 1, 0.01, 'linear');
	end
end