import openfl.events.Event;
import openfl.display.StageAlign;
import openfl.display.StageScaleMode;
import openfl.display.Sprite;

class Walking4 extends Sprite {
	private var segment0:Segment;
	private var segment1:Segment;
	private var segment2:Segment;
	private var segment3:Segment;
	private var cycle:Float = 0;
	private var offset:Float = -Math.PI / 2;

	public function new() {
		super();
		init();
	}

	private function init():Void {
		stage.scaleMode = StageScaleMode.NO_SCALE;
		stage.align = StageAlign.TOP_LEFT;

		segment0 = new Segment(100, 30);
		addChild(segment0);
		segment0.x = 200;
		segment0.y = 100;

		segment1 = new Segment(100, 20);
		addChild(segment1);
		segment1.x = segment0.getPin().x;
		segment1.y = segment0.getPin().y;

		segment2 = new Segment(100, 30);
		addChild(segment2);
		segment2.x = 200;
		segment2.y = 100;

		segment3 = new Segment(100, 20);
		addChild(segment3);
		segment3.x = segment2.getPin().x;
		segment3.y = segment2.getPin().y;

		addEventListener(Event.ENTER_FRAME, onEnterFrame);
	}

	private function onEnterFrame(event:Event):Void {
		walk(segment0, segment1, cycle);
		walk(segment2, segment3, cycle + Math.PI);
		cycle += .05;
	}

	private function walk(segA:Segment, segB:Segment, cyc:Float):Void {
		var angleA:Float = Math.sin(cyc) * 45 + 90;
		var angleB:Float = Math.sin(cyc + offset) * 45 + 45;
		segA.rotation = angleA;
		segB.rotation = segA.rotation + angleB;
		segB.x = segA.getPin().x;
		segB.y = segA.getPin().y;
	}
}
