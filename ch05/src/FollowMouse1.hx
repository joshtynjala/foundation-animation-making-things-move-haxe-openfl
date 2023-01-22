import openfl.display.Sprite;
import openfl.events.Event;

class FollowMouse1 extends Sprite {
	private var arrow:Arrow;
	private var speed:Float = 5;

	public function new() {
		super();
		init();
	}

	private function init():Void {
		arrow = new Arrow();
		addChild(arrow);
		addEventListener(Event.ENTER_FRAME, onEnterFrame);
	}

	private function onEnterFrame(event:Event):Void {
		var dx:Float = mouseX - arrow.x;
		var dy:Float = mouseY - arrow.y;
		var angle:Float = Math.atan2(dy, dx);
		arrow.rotation = angle * 180 / Math.PI;
		var vx:Float = Math.cos(angle) * speed;
		var vy:Float = Math.sin(angle) * speed;
		arrow.x += vx;
		arrow.y += vy;
	}
}
