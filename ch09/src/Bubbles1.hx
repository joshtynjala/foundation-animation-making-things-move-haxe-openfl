import openfl.events.Event;
import openfl.display.Sprite;

class Bubbles1 extends Sprite {
	private var balls:Array<Ball>;
	private var numBalls:Int = 10;
	private var centerBall:Ball;
	private var bounce:Float = -1;
	private var spring:Float = 0.2;

	public function new() {
		super();
		init();
	}

	private function init():Void {
		balls = new Array<Ball>();
		centerBall = new Ball(100, 0xcccccc);
		addChild(centerBall);
		centerBall.x = stage.stageWidth / 2;
		centerBall.y = stage.stageHeight / 2;

		for (i in 0...numBalls) {
			var ball:Ball = new Ball(Math.random() * 40 + 5, Std.int(Math.random() * 0xffffff));
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
		for (i in 0...numBalls) {
			var ball:Ball = balls[i];
			move(ball);
			var dx:Float = ball.x - centerBall.x;
			var dy:Float = ball.y - centerBall.y;
			var dist:Float = Math.sqrt(dx * dx + dy * dy);
			var minDist:Float = ball.radius + centerBall.radius;
			if (dist < minDist) {
				var angle:Float = Math.atan2(dy, dx);
				var tx:Float = centerBall.x + Math.cos(angle) * minDist;
				var ty:Float = centerBall.y + Math.sin(angle) * minDist;
				ball.vx += (tx - ball.x) * spring;
				ball.vy += (ty - ball.y) * spring;
			}
		}
	}

	private function move(ball:Ball):Void {
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
