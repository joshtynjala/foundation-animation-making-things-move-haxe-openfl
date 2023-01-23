import openfl.events.Event;
import openfl.events.MouseEvent;
import openfl.display.Sprite;

class MultiSpring extends Sprite {
	private var ball:Ball;
	private var handles:Array<Ball>;
	private var spring:Float = 0.1;
	private var friction:Float = 0.8;
	private var numHandles:Int = 3;

	public function new() {
		super();
		init();
	}

	private function init():Void {
		ball = new Ball(20);
		addChild(ball);

		handles = new Array<Ball>();
		for (i in 0...numHandles) {
			var handle:Ball = new Ball(10, 0x0000ff);
			handle.x = Math.random() * stage.stageWidth;
			handle.y = Math.random() * stage.stageHeight;
			handle.addEventListener(MouseEvent.MOUSE_DOWN, onPress);
			addChild(handle);
			handles.push(handle);
		}

		addEventListener(Event.ENTER_FRAME, onEnterFrame);
		addEventListener(MouseEvent.MOUSE_UP, onRelease);
	}

	private function onEnterFrame(event:Event):Void {
		for (i in 0...numHandles) {
			var handle:Ball = handles[i];
			var dx:Float = handle.x - ball.x;
			var dy:Float = handle.y - ball.y;
			ball.vx += dx * spring;
			ball.vy += dy * spring;
		}

		ball.vx *= friction;
		ball.vy *= friction;
		ball.x += ball.vx;
		ball.y += ball.vy;

		graphics.clear();
		graphics.lineStyle(1);
		for (i in 0...numHandles) {
			graphics.moveTo(ball.x, ball.y);
			graphics.lineTo(handles[i].x, handles[i].y);
		}
	}

	private function onPress(event:MouseEvent):Void {
		var target:Ball = event.target;
		target.startDrag();
	}

	private function onRelease(event:MouseEvent):Void {
		var target:Ball = event.target;
		target.stopDrag();
	}
}
