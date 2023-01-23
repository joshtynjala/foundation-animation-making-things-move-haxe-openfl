import openfl.events.Event;
import openfl.events.MouseEvent;
import openfl.display.Sprite;

class Easing2 extends Sprite {
	private var ball:Ball;
	private var easing:Float = 0.2;
	private var targetX:Float;
	private var targetY:Float;

	public function new() {
		super();
		init();
	}

	private function init():Void {
		targetX = stage.stageWidth / 2;
		targetY = stage.stageHeight / 2;
		ball = new Ball();
		addChild(ball);
		ball.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
		addEventListener(Event.ENTER_FRAME, onEnterFrame);
	}

	private function onMouseDown(event:MouseEvent):Void {
		ball.startDrag();
		removeEventListener(Event.ENTER_FRAME, onEnterFrame);
		stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
	}

	private function onMouseUp(event:MouseEvent):Void {
		ball.stopDrag();
		addEventListener(Event.ENTER_FRAME, onEnterFrame);
		stage.removeEventListener(MouseEvent.MOUSE_UP, onMouseUp);
	}

	private function onEnterFrame(event:Event):Void {
		var vx:Float = (targetX - ball.x) * easing;
		var vy:Float = (targetY - ball.y) * easing;
		ball.x += vx;
		ball.y += vy;
	}
}
