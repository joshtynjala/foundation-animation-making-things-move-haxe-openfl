import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.Sprite;
import openfl.utils.Assets;

class LoadAsset2 extends Sprite {
	public function new() {
		super();
		init();
	}

	private function init():Void {
		Assets.loadBitmapData("picture_load").onComplete((bmd:BitmapData) -> {
			var bitmap:Bitmap = new Bitmap(bmd);
			addChild(bitmap);
		});
	}
}
