import openfl.geom.Point;
import openfl.events.Event;
import openfl.display.StageScaleMode;
import openfl.display.StageAlign;
import openfl.display.Sprite;

class TwoSegmentReach extends Sprite {
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
		var target:Point = reach(segment0, mouseX, mouseY);
		reach(segment1, target.x, target.y);
		segment0.x = segment1.getPin().x;
		segment0.y = segment1.getPin().y;
	}

	private function reach(segment:Segment, xpos:Float, ypos:Float):Point {
		var dx:Float = xpos - segment.x;
		var dy:Float = ypos - segment.y;
		var angle:Float = Math.atan2(dy, dx);
		segment.rotation = angle * 180 / Math.PI;

		var w:Float = segment.getPin().x - segment.x;
		var h:Float = segment.getPin().y - segment.y;
		var tx:Float = xpos - w;
		var ty:Float = ypos - h;
		return new Point(tx, ty);
	}
}
