import openfl.events.Event;
import openfl.display.StageScaleMode;
import openfl.display.StageAlign;
import openfl.display.Sprite;

class Cosines extends Sprite {
	private var segment0:Segment;
	private var segment1:Segment;

	public function new() {
		super();
		init();
	}

	private function init():Void {
		stage.align = StageAlign.TOP_LEFT;
		stage.scaleMode = StageScaleMode.NO_SCALE;
		segment0 = new Segment(100, 20);
		addChild(segment0);

		segment1 = new Segment(100, 20);
		addChild(segment1);
		segment1.x = stage.stageWidth / 2;
		segment1.y = stage.stageHeight / 2;

		addEventListener(Event.ENTER_FRAME, onEnterFrame);
	}

	private function onEnterFrame(event:Event):Void {
		var dx:Float = mouseX - segment1.x;
		var dy:Float = mouseY - segment1.y;
		var dist:Float = Math.sqrt(dx * dx + dy * dy);

		var a:Float = 100;
		var b:Float = 100;
		var c:Float = Math.min(dist, a + b);

		var B:Float = Math.acos((b * b - a * a - c * c) / (-2 * a * c));
		var C:Float = Math.acos((c * c - a * a - b * b) / (-2 * a * b));
		var D:Float = Math.atan2(dy, dx);
		var E:Float = D + B + Math.PI + C;

		segment1.rotation = (D + B) * 180 / Math.PI;

		segment0.x = segment1.getPin().x;
		segment0.y = segment1.getPin().y;
		segment0.rotation = E * 180 / Math.PI;
	}
}
