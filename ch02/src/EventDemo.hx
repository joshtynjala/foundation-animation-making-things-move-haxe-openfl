import openfl.events.MouseEvent;
import openfl.display.Sprite;

class EventDemo extends Sprite {
	private var eventSprite:Sprite;

	public function new() {
		super();
		init();
	}

	private function init():Void {
		eventSprite = new Sprite();
		addChild(eventSprite);
		eventSprite.graphics.beginFill(0xff0000);
		eventSprite.graphics.drawCircle(0, 0, 100);
		eventSprite.x = stage.stageWidth / 2;
		eventSprite.y = stage.stageHeight / 2;
		eventSprite.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
		eventSprite.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
	}

	private function onMouseDown(event:MouseEvent):Void {
		trace("mouse down");
	}

	private function onMouseUp(event:MouseEvent):Void {
		trace("mouse up");
	}
}
