function onCreate()
	-- background shit
	makeLuaSprite('madnessBG', 'background/madnessBG', -480, -100)
	scaleObject('madnessBG', 1, 1)
	setLuaSpriteScrollFactor('madnessBG', 1, 1);
	
makeAnimatedLuaSprite('speaker', 'background/gfBG', 800, 180); 
		addAnimationByPrefix('speaker', 'idle', 'GF Dancing Beat', 24, true);
        setLuaSpriteScrollFactor('speaker', 1, 1);
			
	addLuaSprite('madnessBG', false);
	addLuaSprite('speaker', false)
end