import openfl.display.StageScaleMode;
import openfl.display.StageAlign;
import openfl.display.Sprite;
import openfl.events.Event;

class MultiSegmentDrag extends Sprite {
	private var segments:Array<Segment>;
	private var numSegments:UInt = 50;

	public function new() {
		super();
		init();
	}

	private function init():Void {
		stage.align = StageAlign.TOP_LEFT;
		stage.scaleMode = StageScaleMode.NO_SCALE;
		segments = new Array();
		for (i in 0...numSegments) {
			var segment:Segment = new Segment(50, 10);
			addChild(segment);
			segments.push(segment);
		}
		addEventListener(Event.ENTER_FRAME, onEnterFrame);
	}

	private function onEnterFrame(event:Event):Void {
		drag(segments[0], mouseX, mouseY);
		for (i in 1...numSegments) {
			var segmentA:Segment = segments[i];
			var segmentB:Segment = segments[i - 1];
			drag(segmentA, segmentB.x, segmentB.y);
		}
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
