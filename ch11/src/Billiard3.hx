import openfl.events.Event;
import openfl.display.StageAlign;
import openfl.display.StageScaleMode;
import openfl.display.Sprite;

class Billiard3 extends Sprite {
	private var ball0:Ball;
	private var ball1:Ball;
	private var bounce:Float = -1.0;

	public function new() {
		super();
		init();
	}

	private function init():Void {
		stage.scaleMode = StageScaleMode.NO_SCALE;
		stage.align = StageAlign.TOP_LEFT;
		ball0 = new Ball(150);
		ball0.mass = 2;
		ball0.x = stage.stageWidth - 200;
		ball0.y = stage.stageHeight - 200;
		ball0.vx = Math.random() * 10 - 5;
		ball0.vy = Math.random() * 10 - 5;
		addChild(ball0);

		ball1 = new Ball(90);
		ball1.mass = 1;
		ball1.x = 100;
		ball1.y = 100;
		ball1.vx = Math.random() * 10 - 5;
		ball1.vy = Math.random() * 10 - 5;
		addChild(ball1);

		addEventListener(Event.ENTER_FRAME, onEnterFrame);
	}

	private function onEnterFrame(event:Event):Void {
		ball0.x += ball0.vx;
		ball0.y += ball0.vy;
		ball1.x += ball1.vx;
		ball1.y += ball1.vy;
		checkCollision(ball0, ball1);
		checkWalls(ball0);
		checkWalls(ball1);
	}

	private function checkWalls(ball:Ball):Void {
		if (ball.x + ball.radius > stage.stageWidth) {
			ball.x = stage.stageWidth - ball.radius;
			ball.vx *= bounce;
		} else if (ball.x - ball.radius < 0) {
			ball.x = ball.radius;
			ball.vx *= bounce;
		}
		if (ball.y + ball.radius > stage.stageHeight) {
			ball.y = stage.stageHeight - ball.radius;
			ball.vy *= bounce;
		} else if (ball.y - ball.radius < 0) {
			ball.y = ball.radius;
			ball.vy *= bounce;
		}
	}

	private function checkCollision(ball0:Ball, ball1:Ball):Void {
		var dx:Float = ball1.x - ball0.x;
		var dy:Float = ball1.y - ball0.y;
		var dist:Float = Math.sqrt(dx * dx + dy * dy);
		if (dist < ball0.radius + ball1.radius) {
			// calculate angle, sine and cosine
			var angle:Float = Math.atan2(dy, dx);
			var sin:Float = Math.sin(angle);
			var cos:Float = Math.cos(angle);

			// rotate ball0's position
			var x0:Float = 0;
			var y0:Float = 0;

			// rotate ball1's position
			var x1:Float = dx * cos + dy * sin;
			var y1:Float = dy * cos - dx * sin;

			// rotate ball0's velocity
			var vx0:Float = ball0.vx * cos + ball0.vy * sin;
			var vy0:Float = ball0.vy * cos - ball0.vx * sin;

			// rotate ball1's velocity
			var vx1:Float = ball1.vx * cos + ball1.vy * sin;
			var vy1:Float = ball1.vy * cos - ball1.vx * sin;

			// collision reaction
			var vxTotal:Float = vx0 - vx1;
			vx0 = ((ball0.mass - ball1.mass) * vx0 + 2 * ball1.mass * vx1) / (ball0.mass + ball1.mass);
			vx1 = vxTotal + vx0;
			x0 += vx0;
			x1 += vx1;

			// rotate positions back
			var x0Final:Float = x0 * cos - y0 * sin;
			var y0Final:Float = y0 * cos + x0 * sin;
			var x1Final:Float = x1 * cos - y1 * sin;
			var y1Final:Float = y1 * cos + x1 * sin;

			// adjust positions to actual screen positions
			ball1.x = ball0.x + x1Final;
			ball1.y = ball0.y + y1Final;
			ball0.x = ball0.x + x0Final;
			ball0.y = ball0.y + y0Final;

			// rotate velocities back
			ball0.vx = vx0 * cos - vy0 * sin;
			ball0.vy = vy0 * cos + vx0 * sin;
			ball1.vx = vx1 * cos - vy1 * sin;
			ball1.vy = vy1 * cos + vx1 * sin;
		}
	}
}
