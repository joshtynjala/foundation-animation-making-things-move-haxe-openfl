import openfl.events.Event;
import openfl.display.StageScaleMode;
import openfl.display.StageAlign;
import openfl.display.Sprite;

class Bounce3D extends Sprite {
	private var ball:Ball;
	private var xpos:Float = 0;
	private var ypos:Float = 0;
	private var zpos:Float = 0;
	private var vx:Float = Math.random() * 10 - 5;
	private var vy:Float = Math.random() * 10 - 5;
	private var vz:Float = Math.random() * 10 - 5;
	private var fl:Float = 250;
	private var vpX:Float;
	private var vpY:Float;
	private var top:Float = -100;
	private var bottom:Float = 100;
	private var left:Float = -100;
	private var right:Float = 100;
	private var front:Float = 100;
	private var back:Float = -100;

	public function new() {
		super();
		init();
	}

	private function init():Void {
		stage.align = StageAlign.TOP_LEFT;
		stage.scaleMode = StageScaleMode.NO_SCALE;

		vpX = stage.stageWidth / 2;
		vpY = stage.stageHeight / 2;

		ball = new Ball(15);
		addChild(ball);
		addEventListener(Event.ENTER_FRAME, onEnterFrame);
	}

	private function onEnterFrame(event:Event):Void {
		xpos += vx;
		ypos += vy;
		zpos += vz;

		var radius:Float = ball.radius;
		if (xpos + radius > right) {
			xpos = right - radius;
			vx *= -1;
		} else if (xpos - radius < left) {
			xpos = left + radius;
			vx *= -1;
		}
		if (ypos + radius > bottom) {
			ypos = bottom - radius;
			vy *= -1;
		} else if (ypos - radius < top) {
			ypos = top + radius;
			vy *= -1;
		}
		if (zpos + radius > front) {
			zpos = front - radius;
			vz *= -1;
		} else if (zpos - radius < back) {
			zpos = back + radius;
			vz *= -1;
		}

		if (zpos > -fl) {
			var scale:Float = fl / (fl + zpos);
			ball.scaleX = ball.scaleY = scale;
			ball.x = vpX + xpos * scale;
			ball.y = vpY + ypos * scale;
			ball.visible = true;
		} else {
			ball.visible = false;
		}
	}
}
