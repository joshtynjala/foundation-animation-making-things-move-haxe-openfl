import openfl.events.MouseEvent;
import openfl.text.TextField;
import openfl.display.Sprite;

class MouseDistance extends Sprite {
	private var sprite1:Sprite;
	private var textField:TextField;

	public function new() {
		super();
		init();
	}

	private function init():Void {
		sprite1 = new Sprite();
		addChild(sprite1);
		sprite1.graphics.beginFill(0x000000);
		sprite1.graphics.drawRect(-2, -2, 4, 4);
		sprite1.graphics.endFill();
		sprite1.x = stage.stageWidth / 2;
		sprite1.y = stage.stageHeight / 2;

		textField = new TextField();
		addChild(textField);
		stage.addEventListener(MouseEvent.MOUSE_MOVE, onMouseMove);
	}

	public function onMouseMove(event:MouseEvent):Void {
		graphics.clear();
		graphics.lineStyle(1, 0, 1);
		graphics.moveTo(sprite1.x, sprite1.y);
		graphics.lineTo(mouseX, mouseY);
		var dx:Float = sprite1.x - mouseX;
		var dy:Float = sprite1.y - mouseY;
		var dist:Float = Math.sqrt(dx * dx + dy * dy);
		textField.text = Std.string(dist);
	}
}
