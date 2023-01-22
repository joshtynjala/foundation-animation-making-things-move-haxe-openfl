import openfl.display.Sprite;
import openfl.events.Event;

class FollowMouse2 extends Sprite {
	private var arrow:Arrow;
	private var vx:Float = 0;
	private var vy:Float = 0;
	private var force:Float = 0.5;

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
		var ax:Float = Math.cos(angle) * force;
		var ay:Float = Math.sin(angle) * force;
		vx += ax;
		vy += ay;
		arrow.x += vx;
		arrow.y += vy;
	}
}
