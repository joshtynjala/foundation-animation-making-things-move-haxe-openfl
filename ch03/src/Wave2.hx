import openfl.events.Event;
import openfl.display.Sprite;

class Wave2 extends Sprite {
	private var angle:Float = 0;
	private var centerY:Float = 200;
	private var range:Float = 50;
	private var xspeed:Float = 1;
	private var yspeed:Float = .05;
	private var xpos:Float;
	private var ypos:Float;

	public function new() {
		super();
		init();
	}

	private function init():Void {
		xpos = 0;
		graphics.lineStyle(1, 0, 1);
		graphics.moveTo(0, centerY);
		addEventListener(Event.ENTER_FRAME, onEnterFrame);
	}

	public function onEnterFrame(event:Event):Void {
		xpos += xspeed;
		angle += yspeed;
		ypos = centerY + Math.sin(angle) * range;
		graphics.lineTo(xpos, ypos);
	}
}
