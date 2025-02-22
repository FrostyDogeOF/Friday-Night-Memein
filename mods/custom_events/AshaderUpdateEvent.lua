local shadersEnabled = true
function onEvent(n, v1, v2) 
    if shadersEnabled then  
        local var ShaderName = v1
        initLuaShader(ShaderName)
        makeLuaSprite('camShader', nil)
        makeGraphic('camShader', screenWidth, screenHeight)
        setSpriteShader('camShader', ShaderName)
        
        runHaxeCode([[
            trace(game.getLuaObject('camShader').shader + ' Has Been Loaded!');
            FlxG.game.setFilters([new ShaderFilter(game.getLuaObject('camShader').shader)]);
        ]])
        function onUpdate(elapsed)
            setShaderFloat('camShader', 'iTime', os.clock())
        end
    end
end
function onDestroy()
    if shadersEnabled then
        runHaxeCode([[
            FlxG.game.setFilters([]);
        ]])
    end
end