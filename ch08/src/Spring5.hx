import openfl.events.Event;
import openfl.display.Sprite;

class Spring5 extends Sprite {
	private var ball:Ball;
	private var spring:Float = 0.1;
	private var targetX:Float;
	private var targetY:Float;
	private var vx:Float = 0;
	private var vy:Float = 0;
	private var friction:Float = 0.95;
	private var gravity:Float = 5;

	public function new() {
		super();
		init();
	}

	private function init():Void {
		targetX = stage.stageWidth / 2;
		targetY = stage.stageHeight / 2;
		ball = new Ball();
		addChild(ball);
		addEventListener(Event.ENTER_FRAME, onEnterFrame);
	}

	private function onEnterFrame(event:Event):Void {
		var dx:Float = mouseX - ball.x;
		var dy:Float = mouseY - ball.y;
		var ax:Float = dx * spring;
		var ay:Float = dy * spring;
		vx += ax;
		vy += ay;
		vy += gravity;
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
