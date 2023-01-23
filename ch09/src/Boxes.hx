import openfl.events.Event;
import openfl.display.Sprite;

class Boxes extends Sprite {
	private var box:Box;
	private var boxes:Array<Box>;
	private var gravity:Float = 0.2;

	public function new() {
		super();
		init();
	}

	private function init():Void {
		boxes = new Array();
		createBox();
		addEventListener(Event.ENTER_FRAME, onEnterFrame);
	}

	private function onEnterFrame(event:Event):Void {
		box.vy += gravity;
		box.y += box.vy;
		if (box.y + box.height / 2 > stage.stageHeight) {
			box.y = stage.stageHeight - box.height / 2;
			createBox();
		}
		for (i in 0...boxes.length) {
			if (box != boxes[i] && box.hitTestObject(boxes[i])) {
				box.y = boxes[i].y - boxes[i].height / 2 - box.height / 2;
				createBox();
			}
		}
	}

	private function createBox():Void {
		box = new Box(Math.random() * 40 + 10, Math.random() * 40 + 10);
		box.x = Math.random() * stage.stageWidth;
		addChild(box);
		boxes.push(box);
	}
}
