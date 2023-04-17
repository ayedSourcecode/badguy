function onCreate()
makeLuaSprite('background', 'metro/background', 0, 0)
makeLuaSptrite('train1', 'metro/train1', 0,0)
makeLuaSptrite('train2', 'metro/train2',0,0)

setScrollFactor('train1', -0.3, 1)
addLuaSprite('background', false)
addLuaSprite('train1',true)
end

--Animated
makeAnimatedLuaSprite('rain', 'metro/rain', 0,0)

addAnimationByPrefix('rain', 'rain', 'rain', 0,0 true)

addLuaSprite('rain')

objectPlayAnimation('rain')
end

end