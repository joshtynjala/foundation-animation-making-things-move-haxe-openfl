import openfl.filters.BlurFilter;
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.events.MouseEvent;
import openfl.events.Event;

class SprayPaint extends Sprite {
	private var canvas:BitmapData;
	private var color:UInt;
	private var size:Float = 50;
	private var density:Int = 50;

	public function new() {
		super();
		init();
	}

	private function init():Void {
		canvas = new BitmapData(stage.stageWidth, stage.stageHeight, true, 0x00000000);
		var bmp:Bitmap = new Bitmap(canvas);
		bmp.filters = [new BlurFilter(2, 2, 3)];
		addChild(bmp);

		stage.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
		stage.addEventListener(MouseEvent.MOUSE_UP, onMouseUp);
	}

	private function onMouseDown(event:MouseEvent):Void {
		color = Std.int(Math.random() * 0xffffff + 0xff000000);
		addEventListener(Event.ENTER_FRAME, onEnterFrame);
	}

	private function onMouseUp(event:MouseEvent):Void {
		removeEventListener(Event.ENTER_FRAME, onEnterFrame);
	}

	private function onEnterFrame(event:Event):Void {
		for (i in 0...density) {
			var angle:Float = Math.random() * Math.PI * 2;
			var radius:Float = Math.random() * size;
			var xpos:Int = Std.int(mouseX + Math.cos(angle) * radius);
			var ypos:Int = Std.int(mouseY + Math.sin(angle) * radius);
			canvas.setPixel32(xpos, ypos, color);
		}
	}
}
