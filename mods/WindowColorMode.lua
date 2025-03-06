                      -----------------------------
                  --//   WINDOW DARK MODE IN LUA   \\--
				 --//    CUSTOM COLORS EXTENSION    \\--
                    --------------------------------- 

						   --   CREDITS   --						    
--  Script and code made by T-Bar: https://www.youtube.com/@tbar7460  --
--    (please leave this message in the script, it acts as credits)    --
--                                :D                                   --

--FFI SETUP--
local ffi = require("ffi");
local dwmapi = ffi.load("dwmapi");
local addr = ffi.load((scriptName:gsub("WindowColorMode.lua", "")).. "/include/AddressParser"); --Had to make a whole new libary to grab a variable's address...

ffi.cdef([[
	typedef void* CONST;
    typedef void* HWND;
    typedef unsigned long DWORD;
	typedef const void *LPCVOID;
	typedef int BOOL;
	
	typedef long LONG;
	typedef LONG HRESULT;
	
	HWND GetActiveWindow();
	HRESULT DwmSetWindowAttribute(HWND hwnd, DWORD dwAttribute, LPCVOID pvAttribute, DWORD cbAttribute);
	void UpdateWindow(HWND hWnd);
	int* get_address(int& var);
]])

--VARIABLES--
local S_OK = 0x00000000;

local windowColorMode = {
	DARK = 0x7ffec8f410bf, --Dark mode
	LIGHT = 0 --Light mode
};
local DWMWA_COLOR_NONE = 0xFFFFFFFE; --Use this with setWindowBorderColor to make a rounded window with no border.

--FUNCTIONS--

---Internal function used to parse the weird BBGGRR format into a normal hexidecimal
---Made by Ghostglowdev
function _rgbHexToBGR(rgb)
	-- conv int hex to string hex
	if type(rgb) == 'number' then rgb = string.format("%x", rgb):upper() end
	-- discard if hex isn't string
	if type(rgb) ~= 'string' then 
		debugPrint('ERROR on loading: '.. scriptName ..': _rgbHexToBGR: Failed to parse into BGR format.') 
		return rgb
	end
	-- discard extras
	rgb = stringStartsWith(rgb, '0x') and rgb:sub(3,8) or stringStartsWith(rgb, '#') and rgb:sub(2,7) or rgb
	rgb = #rgb > 6 and rgb:sub(1,6) or rgb

	-- parse
	local b, g, r = rgb:sub(5,6), rgb:sub(3,4), rgb:sub(1,2)
	return b..g..r 
end

---Sets the window to dark mode
function setDarkMode()
	local window = ffi.C.GetActiveWindow();
	local isDark = dwmapi.DwmSetWindowAttribute(window, 19, ffi.new("int[1]", windowColorMode.DARK), ffi.sizeof(ffi.cast("DWORD", 1)));

	if isDark == 0 or isDark ~= S_OK then
		dwmapi.DwmSetWindowAttribute(window, 20, ffi.new("int[1]", windowColorMode.DARK), ffi.sizeof(ffi.cast("DWORD", 1)));
	end
	
	ffi.C.UpdateWindow(window);
end

---Sets the window to light mode
function setLightMode()
	local window = ffi.C.GetActiveWindow();
	local isLight = dwmapi.DwmSetWindowAttribute(window, 19, ffi.new("int[1]", windowColorMode.LIGHT), ffi.sizeof(ffi.cast("DWORD", 0)));

	if isLight == 0 or isLight ~= S_OK then
		dwmapi.DwmSetWindowAttribute(window, 20, ffi.new("int[1]", windowColorMode.LIGHT), ffi.sizeof(ffi.cast("DWORD", 0)));
	end
	
	ffi.C.UpdateWindow(window);
end

---Shortcut to both "setDarkMode" and "setLightMode", as one function
---@param isDark boolean Is the window dark mode?
function setWindowColorMode(isDark)
	local window = ffi.C.GetActiveWindow();
	local isColorMode = dwmapi.DwmSetWindowAttribute(window, 19, ffi.new("int[1]", (isDark and windowColorMode.DARK or windowColorMode.LIGHT)), ffi.sizeof(ffi.cast("DWORD", (isDark and 1 or 0))));

	if isColorMode == 0 or isColorMode ~= S_OK then
		dwmapi.DwmSetWindowAttribute(window, 20, ffi.new("int[1]", (isDark and windowColorMode.DARK or windowColorMode.LIGHT)), ffi.sizeof(ffi.cast("DWORD", (isDark and 1 or 0))));
	end
	
	ffi.C.UpdateWindow(window);
end

---(Windows 11 ONLY) Sets the window border and header to a color of your choosing
---@param colorHex string The hexidecimal for the color. (The hex should be 0xRRGGBB, '0xRRGGBB', '#RRGGBB', 'RRGGBB')
---@param setHeader boolean Do you want to set the header's color?
---@param setBorder boolean Do you want to set the window border's color?
function setWindowBorderColor(colorHex, setHeader, setBorder)
	local window = ffi.C.GetActiveWindow();
	local strHex = (colorHex == nil or (type(colorHex) ~= 'number' and #colorHex < 6 or false)) and '0xFFFFFF' or _rgbHexToBGR(colorHex)
	local hex = tonumber('0x'..strHex)
	
	if setHeader == nil then setHeader = true end
	if setBorder == nil then setBorder = true end
	
	if setHeader then dwmapi.DwmSetWindowAttribute(window, 35, addr.get_address(ffi.new("int[1]", (hex))), ffi.sizeof(ffi.cast("DWORD", (hex)))); end
	if setBorder then dwmapi.DwmSetWindowAttribute(window, 34, addr.get_address(ffi.new("int[1]", (hex))), ffi.sizeof(ffi.cast("DWORD", (hex)))); end

	ffi.C.UpdateWindow(window);
end

---(Windows 11 ONLY) Sets the window title text to a color of your choosing
---@param colorHex string The hexidecimal for the color. (The hex should be 0xRRGGBB, '0xRRGGBB', '#RRGGBB', 'RRGGBB')
function setWindowTitleColor(colorHex)
    local window = ffi.C.GetActiveWindow();
    local strHex = (colorHex == nil or (type(colorHex) ~= 'number' and #colorHex < 6 or false)) and '0xFFFFFF' or _rgbHexToBGR(colorHex)
    local hex = tonumber('0x'..strHex)
    
    dwmapi.DwmSetWindowAttribute(window, 36, addr.get_address(ffi.new("int[1]", (hex))), ffi.sizeof(ffi.cast("DWORD", (hex))));
    ffi.C.UpdateWindow(window);
end

---Resets the window. Be sure to run this after using "setDarkMode" to force the effect immediately.
---(Unless your using Windows 11, to check if you should redraw automatically, use `string.find(getPropertyFromClass("lime.system.System", "platformLabel"), "10")`)
function redrawWindowHeader()
	setPropertyFromClass('flixel.FlxG', 'stage.window.borderless', true);
	setPropertyFromClass('flixel.FlxG', 'stage.window.borderless', false);
end

                          -- -- Add your extra code here. -- --                        
-- This is currently a template that sets the window to dark mode for one song. Go crazy! --

function onCreatePost()
	setWindowColorMode(true);
	
	--Ensures that the window is only force redrawn if your using Windows 10.
	if string.find(getPropertyFromClass("lime.system.System", "platformLabel"), "10") then
		redrawWindowHeader();
	end
end

function onDestroy()
	setWindowColorMode(false);
	if string.find(getPropertyFromClass("lime.system.System", "platformLabel"), "10") then
		redrawWindowHeader();
	end
end