import openfl.events.Event;
import openfl.display.Sprite;

class VelocityAngle extends Sprite {
	private var ball:Ball;
	private var angle:Float = 45;
	private var speed:Float = 3;

	public function new() {
		super();
		init();
	}

	private function init():Void {
		ball = new Ball();
		addChild(ball);
		ball.x = 50;
		ball.y = 100;
		addEventListener(Event.ENTER_FRAME, onEnterFrame);
	}

	private function onEnterFrame(event:Event):Void {
		var radians:Float = angle * Math.PI / 2;
		var vx:Float = Math.cos(angle) * speed;
		var vy:Float = Math.sin(angle) * speed;
		ball.x += vx;
		ball.y += vy;
	}
}
