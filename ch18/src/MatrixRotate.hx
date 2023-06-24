import openfl.display.Sprite;
import openfl.display.StageAlign;
import openfl.display.StageScaleMode;
import openfl.events.Event;
import openfl.geom.Matrix;

class MatrixRotate extends Sprite {
	private var angle:Float = 0;
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
		angle += .05;
		var cos:Float = Math.cos(angle);
		var sin:Float = Math.sin(angle);
		box.transform.matrix = new Matrix(cos, sin, -sin, cos, stage.stageWidth / 2, stage.stageHeight / 2);
	}
}
