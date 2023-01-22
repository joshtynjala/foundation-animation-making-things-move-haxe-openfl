import openfl.display.Sprite;
import openfl.display.StageAlign;
import openfl.display.StageScaleMode;
import openfl.events.Event;

class Friction1 extends Sprite {
	private var ball:Ball;
	private var vx:Float = 0;
	private var vy:Float = 0;
	private var friction:Float = 0.1;

	public function new() {
		super();
		init();
	}

	private function init():Void {
		stage.scaleMode = StageScaleMode.NO_SCALE;
		stage.align = StageAlign.TOP_LEFT;

		ball = new Ball();
		ball.x = stage.stageWidth / 2;
		ball.y = stage.stageHeight / 2;
		vx = Math.random() * 10 - 5;
		vy = Math.random() * 10 - 5;
		addChild(ball);
		addEventListener(Event.ENTER_FRAME, onEnterFrame);
	}

	private function onEnterFrame(event:Event):Void {
		var speed:Float = Math.sqrt(vx * vx + vy * vy);
		var angle:Float = Math.atan2(vy, vx);
		if (speed > friction) {
			speed -= friction;
		} else {
			speed = 0;
		}
		vx = Math.cos(angle) * speed;
		vy = Math.sin(angle) * speed;
		ball.x += vx;
		ball.y += vy;
	}
}
