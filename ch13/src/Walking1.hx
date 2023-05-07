import openfl.events.Event;
import openfl.display.StageAlign;
import openfl.display.StageScaleMode;
import openfl.display.Sprite;

class Walking1 extends Sprite {
	private var segment0:Segment;
	private var segment1:Segment;
	private var cycle:Float = 0;

	public function new() {
		super();
		init();
	}

	private function init():Void {
		stage.scaleMode = StageScaleMode.NO_SCALE;
		stage.align = StageAlign.TOP_LEFT;

		segment0 = new Segment(100, 20);
		addChild(segment0);
		segment0.x = 200;
		segment0.y = 200;

		segment1 = new Segment(100, 20);
		addChild(segment1);
		segment1.x = segment0.getPin().x;
		segment1.y = segment0.getPin().y;

		addEventListener(Event.ENTER_FRAME, onEnterFrame);
	}

	private function onEnterFrame(event:Event):Void {
		cycle += .05;
		var angle:Float = Math.sin(cycle) * 90;
		segment0.rotation = angle;
		segment1.rotation = segment0.rotation + angle;
		segment1.x = segment0.getPin().x;
		segment1.y = segment0.getPin().y;
	}
}
