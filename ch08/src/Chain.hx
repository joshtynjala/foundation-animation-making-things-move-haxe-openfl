import openfl.display.Sprite;
import openfl.events.Event;

class Chain extends Sprite {
	private var ball0:Ball;
	private var ball1:Ball;
	private var ball2:Ball;
	private var spring:Float = 0.1;
	private var friction:Float = 0.8;
	private var gravity:Float = 5;

	public function new() {
		super();
		init();
	}

	private function init():Void {
		ball0 = new Ball(20);
		addChild(ball0);
		ball1 = new Ball(20);
		addChild(ball1);
		ball2 = new Ball(20);
		addChild(ball2);
		addEventListener(Event.ENTER_FRAME, onEnterFrame);
	}

	private function onEnterFrame(event:Event):Void {
		moveBall(ball0, mouseX, mouseY);
		moveBall(ball1, ball0.x, ball0.y);
		moveBall(ball2, ball1.x, ball1.y);

		graphics.clear();
		graphics.lineStyle(1);
		graphics.moveTo(mouseX, mouseY);
		graphics.lineTo(ball0.x, ball0.y);
		graphics.lineTo(ball1.x, ball1.y);
		graphics.lineTo(ball2.x, ball2.y);
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
