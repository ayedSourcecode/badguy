--credits – badguy (https://youtube.com/c/badguyich) 

function goodNoteHit()
    health = getProperty('health')
    setProperty('health', health+ 0.15);
	if(getProperty('health') > 0.02)then
		setProperty('health', 0.02);
	end
end