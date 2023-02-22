--creator by felicty
dxDrawText = dxDrawText
dxDrawRectangle = dxDrawRectangle
dxDrawCircle = dxDrawCircle
dxDrawImage = dxDrawImage
local sx, sy = guiGetScreenSize()
local w, h = 300,180
local scrX, scrY = (sx-w)/2, (sy-h)/2
user = exports.fel_fonts:getIcon('fa-user')
gear = exports.fel_fonts:getIcon('fa-gear')
FontAwesome = exports.fel_fonts:getFont('FontAwesome',40)
robotoB = exports.fel_fonts:getFont('RobotoB',70)
roboto = exports.fel_fonts:getFont('RobotoB',12)

function draw()
	roundedRectangle(scrX, scrY+15, w, h, 10, tocolor(10,10,10,220))

	if isInBox(scrX+20, scrY+45, 115, 115) then
		roundedRectangle(scrX+20, scrY+45, 115, 115, 13, tocolor(0, 108, 255,180))
		if getKeyState('mouse1') and click+400 <= getTickCount() then 
			click = getTickCount()
			exports["fel_account"]:options_logOut(localPlayer)
			open()
		end
	else
		roundedRectangle(scrX+20, scrY+45, 115, 115, 13, tocolor(10,10,10,235))
	end
	dxDrawText(user, scrX+56, scrY+75, 200, 500, tocolor(200,200,200,255), 0.8, FontAwesome)
	dxDrawText("Karakter Değiştir", scrX+30, scrY+165, 200, 500, tocolor(255,255,255,255), 0.7, roboto)

	if isInBox(scrX+160, scrY+45, 115, 115) then
		roundedRectangle(scrX+160, scrY+45, 115, 115, 13, tocolor(0, 108, 255,180))
		if getKeyState('mouse1') and click+400 <= getTickCount() then 
			click = getTickCount()
			open()
		end
	else
		roundedRectangle(scrX+160, scrY+45, 115, 115, 13, tocolor(10,10,10,235))
	end
	dxDrawText('x', scrX+200, scrY+55, 200, 500, tocolor(175,175,175,255), 0.7, robotoB)
	dxDrawText('Kapat', scrX+200, scrY+165, 200, 500, tocolor(255,255,255,255), 0.7, roboto)
end

function open()
	if getElementData(localPlayer, "loggedin") == 1 then
		if active then
			active = false
			showCursor(false)
			enableAlpha = false
			removeEventHandler("onClientRender",root, draw) --- Oluşturulan menüyü kapat
		else
			active = true
			click = 0
			showCursor(true)
			addEventHandler('onClientRender', root, draw, true, 'low-10')
		end
	end
end
addCommandHandler("home", open)
bindKey("F10","down", "home")

function roundedRectangle(x, y, width, height, radius, color, postGUI, subPixelPositioning)
    dxDrawRectangle(x+radius, y+radius, width-(radius*2), height-(radius*2), color, postGUI, subPixelPositioning)
    dxDrawCircle(x+radius, y+radius, radius, 180, 270, color, color, 16, 1, postGUI)
    dxDrawCircle(x+radius, (y+height)-radius, radius, 90, 180, color, color, 16, 1, postGUI)
    dxDrawCircle((x+width)-radius, (y+height)-radius, radius, 0, 90, color, color, 16, 1, postGUI)
    dxDrawCircle((x+width)-radius, y+radius, radius, 270, 360, color, color, 16, 1, postGUI)
    dxDrawRectangle(x, y+radius, radius, height-(radius*2), color, postGUI, subPixelPositioning)
    dxDrawRectangle(x+radius, y+height-radius, width-(radius*2), radius, color, postGUI, subPixelPositioning)
    dxDrawRectangle(x+width-radius, y+radius, radius, height-(radius*2), color, postGUI, subPixelPositioning)
    dxDrawRectangle(x+radius, y, width-(radius*2), radius, color, postGUI, subPixelPositioning)
end

function isInBox(xS,yS,wS,hS)
    if(isCursorShowing()) then
        local cursorX, cursorY = getCursorPosition()
        sX,sY = guiGetScreenSize()
        cursorX, cursorY = cursorX*sX, cursorY*sY
        if(cursorX >= xS and cursorX <= xS+wS and cursorY >= yS and cursorY <= yS+hS) then
            return true
        else
            return false
        end
    end 
end