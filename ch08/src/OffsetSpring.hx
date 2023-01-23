import openfl.events.Event;
import openfl.display.Sprite;

class OffsetSpring extends Sprite {
	private var ball:Ball;
	private var spring:Float = 0.1;
	private var vx:Float = 0;
	private var vy:Float = 0;
	private var friction:Float = 0.95;
	private var springLength:Float = 100;

	public function new() {
		super();
		init();
	}

	private function init():Void {
		ball = new Ball(20);
		addChild(ball);
		addEventListener(Event.ENTER_FRAME, onEnterFrame);
	}

	private function onEnterFrame(event:Event):Void {
		var dx:Float = ball.x - mouseX;
		var dy:Float = ball.y - mouseY;
		var angle:Float = Math.atan2(dy, dx);
		var targetX:Float = mouseX + Math.cos(angle) * springLength;
		var targetY:Float = mouseY + Math.sin(angle) * springLength;
		vx += (targetX - ball.x) * spring;
		vy += (targetY - ball.y) * spring;
		vx *= friction;
		vy *= friction;
		ball.x += vx;
		ball.y += vy;
		graphics.clear();
		graphics.lineStyle(1);
		graphics.moveTo(ball.x, ball.y);
		graphics.lineTo(mouseX, mouseY);
	}
}
