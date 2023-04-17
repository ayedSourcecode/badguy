function onCreate()
	-- background shit
	makeLuaSprite('remakebg', 'background/remakebg', -1000, -1000)
	scaleObject('remakebg', 1, 1)
	setLuaSpriteScrollFactor('remakebg', 1, 1);

	addLuaSprite('remakebg', false)	
end