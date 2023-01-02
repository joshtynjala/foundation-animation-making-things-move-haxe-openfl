import openfl.events.Event;
import openfl.display.Sprite;

class RotateToMouse extends Sprite {
	private var arrow:Arrow;

	public function new() {
		super();
		init();
	}

	private function init():Void {
		arrow = new Arrow();
		addChild(arrow);
		arrow.x = stage.stageWidth / 2;
		arrow.y = stage.stageHeight / 2;
		addEventListener(Event.ENTER_FRAME, onEnterFrame);
	}

	public function onEnterFrame(event:Event):Void {
		var dx:Float = mouseX - arrow.x;
		var dy:Float = mouseY - arrow.y;
		var radians:Float = Math.atan2(dy, dx);
		arrow.rotation = radians * 180 / Math.PI;
	}
}
