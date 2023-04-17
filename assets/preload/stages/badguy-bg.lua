function onCreate()
	-- background shit
	makeLuaSprite('badguyBGsky', 'background/badguyBGsky', -480, -100)
	makeLuaSprite('badguyBGfront', 'background/badguyBGfront', -480, -100)
	scaleObject('badguyBGsky', 1, 1)
	scaleObject('badguyBGfront', 1, 1)
	setLuaSpriteScrollFactor('badguyBGsky', 1, 1);
	setLuaSpriteScrollFactor('badguyBGfront', 1, 1);

	addLuaSprite('badguyBGsky', false)
    addLuaSprite('badguyBGfront', false)	
end