import openfl.ui.Keyboard;
import openfl.events.KeyboardEvent;
import openfl.display.Sprite;

class KeyCodes extends Sprite {
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
		ball.graphics.endFill();
		ball.x = stage.stageWidth / 2;
		ball.y = stage.stageHeight / 2;
		stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyboardEvent);
	}

	public function onKeyboardEvent(event:KeyboardEvent):Void {
		switch (event.keyCode) {
			case Keyboard.UP:
				ball.y -= 10;

			case Keyboard.DOWN:
				ball.y += 10;

			case Keyboard.LEFT:
				ball.x -= 10;

			case Keyboard.RIGHT:
				ball.x += 10;
		}
	}
}
