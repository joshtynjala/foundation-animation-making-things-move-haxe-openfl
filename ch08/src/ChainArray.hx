import openfl.events.Event;
import openfl.display.Sprite;

class ChainArray extends Sprite {
	private var balls:Array<Ball>;
	private var numBalls:Int = 5;
	private var spring:Float = 0.1;
	private var friction:Float = 0.8;
	private var gravity:Float = 5;

	public function new() {
		super();
		init();
	}

	private function init():Void {
		balls = new Array<Ball>();
		for (i in 0...numBalls) {
			var ball:Ball = new Ball(20);
			addChild(ball);
			balls.push(ball);
		}
		addEventListener(Event.ENTER_FRAME, onEnterFrame);
	}

	private function onEnterFrame(event:Event):Void {
		graphics.clear();
		graphics.lineStyle(1);
		graphics.moveTo(mouseX, mouseY);
		moveBall(balls[0], mouseX, mouseY);
		graphics.lineTo(balls[0].x, balls[0].y);

		for (i in 1...numBalls) {
			var ballA:Ball = balls[i - 1];
			var ballB:Ball = balls[i];
			moveBall(ballB, ballA.x, ballA.y);
			graphics.lineTo(ballB.x, ballB.y);
		}
	}

	private function moveBall(ball:Ball, targetX:Float, targetY:Float):Void {
		ball.vx += (targetX - ball.x) * spring;
		ball.vy += (targetY - ball.y) * spring;
		ball.vy += gravity;
		ball.vx *= friction;
		ball.vy *= friction;
		ball.x += ball.vx;
		ball.y += ball.vy;
	}
}
