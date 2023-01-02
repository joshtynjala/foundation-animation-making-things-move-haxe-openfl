import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;

class SimpleBitmap extends Sprite {
	public function new() {
		super();
		init();
	}

	private function init():Void {
		var myBitmapData:BitmapData = new BitmapData(100, 100, false, 0xff0000);
		var myBitmap:Bitmap = new Bitmap(myBitmapData);
		addChild(myBitmap);
	}
}
