import openfl.events.MouseEvent;
import openfl.display.Sprite;

class MouseEvents extends Sprite {
	public function new() {
		super();
		init();
	}

	private function init():Void {
		var ball:Ball = new Ball();
		ball.x = 100;
		ball.y = 100;
		addChild(ball);

		ball.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDownBall);
		ball.addEventListener(MouseEvent.MOUSE_UP, onMouseUpBall);
		ball.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMoveBall);

		stage.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDownStage);
		stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUpStage);
		stage.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMoveStage);
	}

	private function onMouseDownBall(event:MouseEvent):Void {
		trace("mouse down - ball");
	}

	private function onMouseUpBall(event:MouseEvent):Void {
		trace("mouse up - ball");
	}

	private function onMouseMoveBall(event:MouseEvent):Void {
		trace("mouse move - ball");
	}

	private function onMouseDownStage(event:MouseEvent):Void {
		trace("mouse down - stage");
	}

	private function onMouseUpStage(event:MouseEvent):Void {
		trace("mouse up - stage");
	}

	private function onMouseMoveStage(event:MouseEvent):Void {
		trace("mouse move - stage");
	}
}
