import openfl.events.MouseEvent;
import openfl.display.Sprite;

class MousePos extends Sprite {
	private var sprite:Sprite;

	public function new() {
		super();
		init();
	}

	private function init():Void {
		sprite = new Sprite();
		addChild(sprite);
		sprite.graphics.beginFill(0xff0000);
		sprite.graphics.drawRect(0, 0, 100, 100);
		sprite.graphics.endFill();
		sprite.x = 100;
		sprite.y = 100;
		stage.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
	}

	public function onMouseMove(event:MouseEvent):Void {
		trace("mouseX: " + mouseX + ", mouseY:" + mouseY);
		trace("sprite.mouseX: " + sprite.mouseX + ", sprite.mouseY: " + sprite.mouseY);
	}
}
