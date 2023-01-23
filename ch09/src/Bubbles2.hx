import openfl.events.Event;
import openfl.display.Sprite;

class Bubbles2 extends Sprite {
	private var balls:Array<Ball>;
	private var numBalls:Int = 30;
	private var bounce:Float = -0.5;
	private var spring:Float = 0.05;
	private var gravity:Float = 0.1;

	public function new() {
		super();
		init();
	}

	private function init():Void {
		balls = new Array<Ball>();

		for (i in 0...numBalls) {
			var ball:Ball = new Ball(Math.random() * 30 + 20, Std.int(Math.random() * 0xffffff));
			ball.x = Math.random() * stage.stageWidth;
			ball.y = Math.random() * stage.stageHeight;
			ball.vx = Math.random() * 6 - 3;
			ball.vy = Math.random() * 6 - 3;
			addChild(ball);
			balls.push(ball);
		}

		addEventListener(Event.ENTER_FRAME, onEnterFrame);
	}

	private function onEnterFrame(event:Event):Void {
		for (i in 0...numBalls - 1) {
			var ball0:Ball = balls[i];
			for (j in i + 1...numBalls) {
				var ball1:Ball = balls[j];
				var dx:Float = ball1.x - ball0.x;
				var dy:Float = ball1.y - ball0.y;
				var dist:Float = Math.sqrt(dx * dx + dy * dy);
				var minDist:Float = ball0.radius + ball1.radius;
				if (dist < minDist) {
					var angle:Float = Math.atan2(dy, dx);
					var tx:Float = ball0.x + dx / dist * minDist;
					var ty:Float = ball0.y + dy / dist * minDist;
					var ax:Float = (tx - ball1.x) * spring;
					var ay:Float = (ty - ball1.y) * spring;
					ball0.vx -= ax;
					ball0.vy -= ay;
					ball1.vx += ax;
					ball1.vy += ay;
				}
			}
		}

		for (i in 0...numBalls) {
			var ball:Ball = balls[i];
			move(ball);
		}
	}

	private function move(ball:Ball):Void {
		ball.vy += gravity;
		ball.x += ball.vx;
		ball.y += ball.vy;
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
}
