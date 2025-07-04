local ModName = "fine bobs and shitlick" --Your Mod name Here

function onCreate()
	setPropertyFromClass("openfl.Lib", "application.window.title", ModName .. " - PLAYING: " .. (songName) .. " - " .. getProperty('storyDifficultyText'))
changeDiscordPresence('fine bobs and shitlick')
end