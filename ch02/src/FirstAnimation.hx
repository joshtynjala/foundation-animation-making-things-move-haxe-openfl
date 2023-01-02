import openfl.events.Event;
import openfl.display.Sprite;

class FirstAnimation extends Sprite {
	private var ball:Sprite;

	public function new() {
		super();
		init();
	}

	private function init():Void {
		ball = new Sprite();
		addChild(ball);
		ball.graphics.beginFill(0xff0000);
		ball.graphics.drawCircle(0, 0, 40);
		ball.x = 20;
		ball.y = stage.stageHeight / 2;
		ball.addEventListener(Event.ENTER_FRAME, onEnterFrame);
	}

	private function onEnterFrame(event:Event):Void {
		ball.x++;
	}
}
