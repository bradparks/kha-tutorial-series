package;

import kha.Framebuffer;
import kha.Key;
import kha.input.Keyboard;

import Player;

class Project {
	public var player:Player;
	
	public function new() {
		player = new Player();
		Keyboard.get().notify(onKeyDown, onKeyUp);
	}

	public function update():Void {
		if (player.up){
			player.y -= Math.round(player.speed);
		} else if (player.down){
			player.y += Math.round(player.speed);
		}
		
		if (player.left){
			player.x -= Math.round(player.speed);
		} else if (player.right){
			player.x += Math.round(player.speed);
		}
	}

	public function render(framebuffer:Framebuffer):Void {
		var graphics = framebuffer.g2;
		graphics.begin();
		player.render(graphics);
		graphics.end();
	}
	
	public function onKeyDown(key:Key, char:String){
		switch (key){
			case UP: player.up = true;
			case DOWN: player.down = true;
			case LEFT: player.left = true;
			case RIGHT: player.right = true;
		default: return;
		}
	}
	
	public function onKeyUp(key:Key, char:String){
		switch (key){
			case UP: player.up = false;
			case DOWN: player.down = false;
			case LEFT: player.left = false;
			case RIGHT: player.right = false;
		default: return;
		}
	}
}
