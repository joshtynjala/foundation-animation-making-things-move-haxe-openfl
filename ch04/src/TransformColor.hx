import openfl.geom.ColorTransform;
import openfl.utils.Assets;
import openfl.display.Bitmap;
import openfl.display.Sprite;

class TransformColor extends Sprite {
	public function new() {
		super();
		init();
	}

	private function init():Void {
		var pic:Bitmap = new Bitmap(Assets.getBitmapData("picture_embedded"));
		addChild(pic);

		pic.transform.colorTransform = new ColorTransform(-1, -1, -1, 1, 255, 255, 255, 0);
	}
}
