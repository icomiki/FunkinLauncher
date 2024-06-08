ini_open("launcheroptions.ini")
var play = ini_read_real("Launcher", "playStickerAnimation", 1)
ini_close()
if !play
{
	instance_destroy();
	exit;
}
stickers = []
sticks = []
chars = ["bfSticker", "gfSticker", "dadSticker", "momSticker", "monsterSticker", "picoSticker"]
xPos = -100
yPos = -100
frameCounter = 0;
stickLength = 0;
while (xPos <= display_get_gui_width())
{
	var sticky = {x: 0, y: 0, rot: 0, index: asset_get_index(chars[irandom_range(0, array_length(chars) - 1)] + string(irandom_range(1, 3))), size: random_range(0.97, 1.02)}
	sticky.x = xPos
	sticky.y = yPos
	xPos += sprite_get_height(sticky.index) / 2
	if xPos >= display_get_gui_width()
	{
		if yPos <= display_get_gui_height()
		{
          xPos = -100;
          yPos += random_range(70, 120);
		}
	}
	sticky.rot = random_range(-60, 70);
	array_push(sticks, sticky)
	stickLength = array_length(sticks)
}