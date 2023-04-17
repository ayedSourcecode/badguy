--credits – badguy (https://youtube.com/c/badguyich) 

function onCreate()
    health = getProperty('health')
    setProperty('health', health+ 0.15);
	if(getProperty('health') > 0.5)then
		setProperty('health', 0.5);
	end
end

function onCreate()
setProperty("healthBar.y", 5000)
    if getProperty("iconP2.visible", true) then
        setProperty("iconP2.visible", false)
     
    if getProperty("iconP1.visible", true) then
        setProperty("iconP1.visible", false)
   end
   end
end