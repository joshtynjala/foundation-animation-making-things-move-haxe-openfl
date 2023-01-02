import openfl.display.Loader;
import openfl.display.Sprite;
import openfl.net.URLRequest;
import openfl.utils.Assets;

class LoadAsset1 extends Sprite {
	public function new() {
		super();
		init();
	}

	private function init():Void {
		var loader:Loader = new Loader();
		addChild(loader);
		var path:String = Assets.getPath("picture_load");
		loader.load(new URLRequest(path));
	}
}
