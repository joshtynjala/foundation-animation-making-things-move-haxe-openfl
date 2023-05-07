import openfl.display.StageScaleMode;
import openfl.display.StageAlign;
import openfl.events.Event;
import openfl.display.Sprite;

class OneSegment extends Sprite {
	private var segment0:Segment;

	public function new() {
		super();
		init();
	}

	private function init():Void {
		stage.align = StageAlign.TOP_LEFT;
		stage.scaleMode = StageScaleMode.NO_SCALE;
		segment0 = new Segment(100, 20);
		addChild(segment0);
		segment0.x = stage.stageWidth / 2;
		segment0.y = stage.stageHeight / 2;

		addEventListener(Event.ENTER_FRAME, onEnterFrame);
	}

	private function onEnterFrame(event:Event):Void {
		var dx:Float = mouseX - segment0.x;
		var dy:Float = mouseY - segment0.y;
		var angle:Float = Math.atan2(dy, dx);
		segment0.rotation = angle * 180 / Math.PI;
	}
}
