import openfl.events.Event;
import openfl.display.StageScaleMode;
import openfl.display.StageAlign;
import openfl.display.Sprite;

class TwoSegmentDrag extends Sprite {
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

		addEventListener(Event.ENTER_FRAME, onEnterFrame);
	}

	private function onEnterFrame(event:Event):Void {
		drag(segment0, mouseX, mouseY);
		drag(segment1, segment0.x, segment0.y);
	}

	private function drag(segment:Segment, xpos:Float, ypos:Float):Void {
		var dx:Float = xpos - segment.x;
		var dy:Float = ypos - segment.y;
		var angle:Float = Math.atan2(dy, dx);
		segment.rotation = angle * 180 / Math.PI;

		var w:Float = segment.getPin().x - segment.x;
		var h:Float = segment.getPin().y - segment.y;
		segment.x = xpos - w;
		segment.y = ypos - h;
	}
}
