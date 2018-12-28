
local keyboard = libs.keyboard;

--@help Lower system volume
actions.volume_down = function()
	keyboard.press("volumedown");
end

--@help Mute system volume
actions.volume_mute = function()
	keyboard.press("volumemute");
end

--@help Raise system volume
actions.volume_up = function()
	keyboard.press("volumeup");
end

--@help Navigate left
actions.leftkey = function()
	keyboard.stroke("left");
end

--@help Navigate right
actions.rightkey = function()
	keyboard.stroke("right");
end


dragging = false;

local mouse = libs.mouse;

function update (r)
	--server.update({id = "touch", text = r });
end

actions.down = function ()
	update("down");
end

actions.up = function ()
	update("up");
end

actions.tap = function ()
	update("tap");
	if (dragging) then
		dragging = false;
		mouse.dragend();
		mouse.up();
	else
		mouse.click("left");
	end
end

actions.double = function ()
	update("double");
	mouse.double("left");
end

actions.hold = function ()
	update("hold");
	mouse.down();
	mouse.dragbegin();
	dragging = true;
end

actions.delta = function  (id, x, y)
	update("delta: " .. x .. " " .. y);
	mouse.moveraw(x * 2, y * 2);
end
