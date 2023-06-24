import openfl.display.Sprite;
import openfl.display.StageAlign;
import openfl.display.StageScaleMode;
import openfl.events.Event;

class Zsort extends Sprite {
	private var balls:Array<Ball3D>;
	private var numBalls:UInt = 50;
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

		balls = [];
		for (i in 0...numBalls) {
			var ball:Ball3D = new Ball3D(15);
			balls.push(ball);
			ball.vx = Math.random() * 10 - 5;
			ball.vy = Math.random() * 10 - 5;
			ball.vz = Math.random() * 10 - 5;
			addChild(ball);
		}
		addEventListener(Event.ENTER_FRAME, onEnterFrame);
	}

	private function onEnterFrame(event:Event):Void {
		for (i in 0...numBalls) {
			var ball:Ball3D = balls[i];
			move(ball);
		}
		sortZ();
	}

	private function move(ball:Ball3D):Void {
		var radius:Float = ball.radius;

		ball.xpos += ball.vx;
		ball.ypos += ball.vy;
		ball.zpos += ball.vz;

		if (ball.xpos + radius > right) {
			ball.xpos = right - radius;
			ball.vx *= -1;
		} else if (ball.xpos - radius < left) {
			ball.xpos = left + radius;
			ball.vx *= -1;
		}
		if (ball.ypos + radius > bottom) {
			ball.ypos = bottom - radius;
			ball.vy *= -1;
		} else if (ball.ypos - radius < top) {
			ball.ypos = top + radius;
			ball.vy *= -1;
		}
		if (ball.zpos + radius > front) {
			ball.zpos = front - radius;
			ball.vz *= -1;
		} else if (ball.zpos - radius < back) {
			ball.zpos = back + radius;
			ball.vz *= -1;
		}

		if (ball.zpos > -fl) {
			var scale:Float = fl / (fl + ball.zpos);
			ball.scaleX = ball.scaleY = scale;
			ball.x = vpX + ball.xpos * scale;
			ball.y = vpY + ball.ypos * scale;
			ball.visible = true;
		} else {
			ball.visible = false;
		}
	}

	private function sortZ():Void {
		balls.sort((a, b) -> {
			var zposA = a.zpos;
			var zposB = b.zpos;
			if (zposA < zposB) {
				return 1;
			}
			if (zposA > zposB) {
				return -1;
			}
			return 0;
		});
		for (i in 0...numBalls) {
			var ball:Ball3D = balls[i];
			setChildIndex(ball, i);
		}
	}
}
