import openfl.display.BitmapData;
import openfl.display.Bitmap;
import openfl.display.Sprite;

class EmbedAsset1 extends Sprite {
	public function new() {
		super();
		init();
	}

	private function init():Void {
		var img:Bitmap = new Bitmap(new Image(320, 240));
		addChild(img);
	}
}

@:bitmap("picture.jpg")
class Image extends BitmapData {}
