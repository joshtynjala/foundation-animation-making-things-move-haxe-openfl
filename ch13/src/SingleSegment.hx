import openfl.events.Event;
import openfl.display.StageAlign;
import openfl.display.StageScaleMode;
import openfl.display.Sprite;

class SingleSegment extends Sprite {
	private var slider:SimpleSlider;
	private var segment:Segment;

	public function new() {
		super();
		init();
	}

	private function init():Void {
		stage.scaleMode = StageScaleMode.NO_SCALE;
		stage.align = StageAlign.TOP_LEFT;

		segment = new Segment(100, 20);
		addChild(segment);
		segment.x = 100;
		segment.y = 100;

		slider = new SimpleSlider(-90, 90, 0);
		addChild(slider);
		slider.x = 300;
		slider.y = 20;
		slider.addEventListener(Event.CHANGE, onChange);
	}

	private function onChange(event:Event):Void {
		segment.rotation = slider.value;
	}
}
