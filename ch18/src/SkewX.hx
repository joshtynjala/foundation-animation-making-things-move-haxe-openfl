import openfl.display.Sprite;
import openfl.display.StageAlign;
import openfl.display.StageScaleMode;
import openfl.events.Event;
import openfl.geom.Matrix;

class SkewX extends Sprite {
	private var box:Sprite;

	public function new() {
		super();
		init();
	}

	private function init():Void {
		stage.align = StageAlign.TOP_LEFT;
		stage.scaleMode = StageScaleMode.NO_SCALE;
		box = new Sprite();
		box.graphics.beginFill(0xff0000);
		box.graphics.drawRect(-50, -50, 100, 100);
		box.graphics.endFill();
		addChild(box);
		addEventListener(Event.ENTER_FRAME, onEnterFrame);
	}

	private function onEnterFrame(event:Event):Void {
		var skewX:Float = (mouseX - stage.stageWidth / 2) * .01;
		box.transform.matrix = new Matrix(1, 0, skewX, 1, stage.stageWidth / 2, stage.stageHeight / 2);
	}
}
