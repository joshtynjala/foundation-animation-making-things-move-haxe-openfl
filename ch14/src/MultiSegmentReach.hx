import openfl.geom.Point;
import openfl.events.Event;
import openfl.display.StageScaleMode;
import openfl.display.StageAlign;
import openfl.display.Sprite;

class MultiSegmentReach extends Sprite {
	private var segments:Array<Segment>;
	private var numSegments:UInt = 6;

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
		var segment:Segment = segments[segments.length - 1];
		segment.x = stage.stageWidth / 2;
		segment.y = stage.stageHeight / 2;
		addEventListener(Event.ENTER_FRAME, onEnterFrame);
	}

	private function onEnterFrame(event:Event):Void {
		var target:Point = reach(segments[0], mouseX, mouseY);
		for (i in 1...numSegments) {
			var segment:Segment = segments[i];
			target = reach(segment, target.x, target.y);
		}
		var i = numSegments - 1;
		while (i > 0) {
			var segmentA:Segment = segments[i];
			var segmentB:Segment = segments[i - 1];
			position(segmentB, segmentA);
			i--;
		}
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

	private function position(segmentA:Segment, segmentB:Segment):Void {
		segmentA.x = segmentB.getPin().x;
		segmentA.y = segmentB.getPin().y;
	}
}
