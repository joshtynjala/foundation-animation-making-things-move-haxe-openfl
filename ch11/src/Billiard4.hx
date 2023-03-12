import openfl.display.StageAlign;
import openfl.display.StageScaleMode;
import openfl.events.Event;
import openfl.geom.Point;
import openfl.display.Sprite;

class Billiard4 extends Sprite {
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
			var pos0:Point = new Point(0, 0);

			// rotate ball1's position
			var pos1:Point = rotate(dx, dy, sin, cos, true);

			// rotate ball0's velocity
			var vel0:Point = rotate(ball0.vx, ball0.vy, sin, cos, true);

			// rotate ball1's velocity
			var vel1:Point = rotate(ball1.vx, ball1.vy, sin, cos, true);

			// collision reaction
			var vxTotal:Float = vel0.x - vel1.x;
			vel0.x = ((ball0.mass - ball1.mass) * vel0.x + 2 * ball1.mass * vel1.x) / (ball0.mass + ball1.mass);
			vel1.x = vxTotal + vel0.x;

			// update position
			pos0.x += vel0.x;
			pos1.x += vel1.x;

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
