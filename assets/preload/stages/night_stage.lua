function onCreate()
	-- background shit
	makeLuaSprite('night', 'night_stage', -480, -100)
	scaleObject('night', 1, 1)
	setLuaSpriteScrollFactor('night', 1, 1);
			
	addLuaSprite('night', false)
end