import openfl.utils.Assets;
import openfl.display.BitmapData;
import openfl.display.Bitmap;
import openfl.display.Sprite;

class EmbedAsset2 extends Sprite {
	public function new() {
		super();
		init();
	}

	private function init():Void {
		var bmd:BitmapData = Assets.getBitmapData("picture_embedded");
		var img:Bitmap = new Bitmap(bmd);
		addChild(img);
	}
}
