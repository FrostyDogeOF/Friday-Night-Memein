local ModName = "FNF Vs Angy Cat" --Your Mod name Here

function onCreate()
	setPropertyFromClass("openfl.Lib", "application.window.title", ModName .. " - PLAYING: " .. (songName) .. " - " .. getProperty('storyDifficultyText'))
changeDiscordPresence('Making a *ahem* Special Project...')
end
function onDestroy()
	setPropertyFromClass("openfl.Lib", "application.window.title", ModName)
end
function onPause()
	setPropertyFromClass("openfl.Lib", "application.window.title", ModName .. " - PAUSED ON: " .. (songName) .. " - " .. getProperty('storyDifficultyText'))
end
function onResume()
	setPropertyFromClass("openfl.Lib", "application.window.title", ModName .. " - PLAYING: " .. (songName) .. " - " .. getProperty('storyDifficultyText'))
end
function onGameOver()
	setPropertyFromClass("openfl.Lib", "application.window.title", ModName .. " - GAMEOVER ON: " .. (songName) .. " - " .. getProperty('storyDifficultyText'))
end