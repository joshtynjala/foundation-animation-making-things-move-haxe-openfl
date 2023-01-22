import openfl.events.Event;
import openfl.display.Sprite;

class RotationalVelocity extends Sprite {
	private var arrow:Arrow;
	private var vr:Float = 5;

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

	private function onEnterFrame(event:Event):Void {
		arrow.rotation += vr;
	}
}
