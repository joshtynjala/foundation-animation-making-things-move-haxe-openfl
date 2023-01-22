import openfl.events.Event;
import openfl.events.MouseEvent;
import openfl.display.StageAlign;
import openfl.display.StageScaleMode;
import openfl.display.Sprite;

class Throwing extends Sprite {
	private var ball:Ball;
	private var vx:Float;
	private var vy:Float;
	private var bounce:Float = -0.7;
	private var gravity:Float = .5;
	private var oldX:Float;
	private var oldY:Float;

	public function new() {
		super();
		init();
	}

	private function init():Void {
		stage.scaleMode = StageScaleMode.NO_SCALE;
		stage.align = StageAlign.TOP_LEFT;

		ball = new Ball();
		ball.x = stage.stageWidth / 2;
		ball.y = stage.stageHeight / 2;
		vx = Math.random() * 10 - 5;
		vy = -10;
		addChild(ball);
		ball.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
		addEventListener(Event.ENTER_FRAME, onEnterFrame);
	}

	private function onEnterFrame(event:Event):Void {
		vy += gravity;
		ball.x += vx;
		ball.y += vy;
		var left:Float = 0;
		var right:Float = stage.stageWidth;
		var top:Float = 0;
		var bottom:Float = stage.stageHeight;

		if (ball.x + ball.radius > right) {
			ball.x = right - ball.radius;
			vx *= bounce;
		} else if (ball.x - ball.radius < left) {
			ball.x = left + ball.radius;
			vx *= bounce;
		}
		if (ball.y + ball.radius > bottom) {
			ball.y = bottom - ball.radius;
			vy *= bounce;
		} else if (ball.y - ball.radius < top) {
			ball.y = top + ball.radius;
			vy *= bounce;
		}
	}

	private function onMouseDown(event:MouseEvent):Void {
		oldX = ball.x;
		oldY = ball.y;
		stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
		ball.startDrag();
		removeEventListener(Event.ENTER_FRAME, onEnterFrame);
		addEventListener(Event.ENTER_FRAME, trackVelocity);
	}

	private function onMouseUp(event:MouseEvent):Void {
		stage.removeEventListener(MouseEvent.MOUSE_UP, onMouseUp);
		ball.stopDrag();
		removeEventListener(Event.ENTER_FRAME, trackVelocity);
		addEventListener(Event.ENTER_FRAME, onEnterFrame);
	}

	private function trackVelocity(event:Event):Void {
		vx = ball.x - oldX;
		vy = ball.y - oldY;
		oldX = ball.x;
		oldY = ball.y;
	}
}
