import openfl.geom.Point;
import openfl.events.Event;
import openfl.display.StageAlign;
import openfl.display.StageScaleMode;
import openfl.display.Sprite;

class SameMass extends Sprite {
	private var balls:Array<Ball>;
	private var numBalls:UInt = 20;
	private var bounce:Float = -1.0;

	public function new() {
		super();
		init();
	}

	private function init():Void {
		stage.scaleMode = StageScaleMode.NO_SCALE;
		stage.align = StageAlign.TOP_LEFT;

		balls = [];
		for (i in 0...numBalls) {
			var radius:Float = 30;
			var ball:Ball = new Ball(radius);
			ball.mass = radius;
			ball.x = Math.random() * stage.stageWidth;
			ball.y = Math.random() * stage.stageHeight;
			ball.vx = Math.random() * 10 - 5;
			ball.vy = Math.random() * 10 - 5;
			addChild(ball);
			balls.push(ball);
		}

		addEventListener(Event.ENTER_FRAME, onEnterFrame);
	}

	private function onEnterFrame(event:Event):Void {
		for (i in 0...numBalls) {
			var ball:Ball = balls[i];
			ball.x += ball.vx;
			ball.y += ball.vy;
			checkWalls(ball);
		}
		for (i in 0...(numBalls - 1)) {
			var ballA:Ball = balls[i];
			for (j in (i + 1)...numBalls) {
				var ballB:Ball = balls[j];
				checkCollision(ballA, ballB);
			}
		}
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
			var pos0:Point = new Point(0, 0);

			// rotate ball1's position
			var pos1:Point = rotate(dx, dy, sin, cos, true);

			// rotate ball0's velocity
			var vel0:Point = rotate(ball0.vx, ball0.vy, sin, cos, true);

			// rotate ball1's velocity
			var vel1:Point = rotate(ball1.vx, ball1.vy, sin, cos, true);

			// swap the two velocities
			var temp:Point = vel0;
			vel0 = vel1;
			vel1 = temp;

			// update position
			var absV:Float = Math.abs(vel0.x) + Math.abs(vel1.x);
			var overlap:Float = (ball0.radius + ball1.radius) - Math.abs(pos0.x - pos1.x);
			pos0.x += vel0.x / absV * overlap;
			pos1.x += vel1.x / absV * overlap;

			// rotate positions back
			var pos0F:Point = rotate(pos0.x, pos0.y, sin, cos, false);

			var pos1F:Point = rotate(pos1.x, pos1.y, sin, cos, false);

			// adjust positions to actual screen positions
			ball1.x = ball0.x + pos1F.x;
			ball1.y = ball0.y + pos1F.y;
			ball0.x = ball0.x + pos0F.x;
			ball0.y = ball0.y + pos0F.y;

			// rotate velocities back
			var vel0F:Point = rotate(vel0.x, vel0.y, sin, cos, false);
			var vel1F:Point = rotate(vel1.x, vel1.y, sin, cos, false);
			ball0.vx = vel0F.x;
			ball0.vy = vel0F.y;
			ball1.vx = vel1F.x;
			ball1.vy = vel1F.y;
		}
	}

	private function rotate(x:Float, y:Float, sin:Float, cos:Float, reverse:Bool):Point {
		var result:Point = new Point();
		if (reverse) {
			result.x = x * cos + y * sin;
			result.y = y * cos - x * sin;
		} else {
			result.x = x * cos - y * sin;
			result.y = y * cos + x * sin;
		}
		return result;
	}
}
