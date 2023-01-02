import openfl.events.KeyboardEvent;
import openfl.display.Sprite;

class KeyboardEvents extends Sprite {
	public function new() {
		super();
		init();
	}

	private function init():Void {
		stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyboardEvent);
		stage.addEventListener(KeyboardEvent.KEY_UP, onKeyboardEvent);
	}

	public function onKeyboardEvent(event:KeyboardEvent):Void {
		trace(event.type);
	}
}
