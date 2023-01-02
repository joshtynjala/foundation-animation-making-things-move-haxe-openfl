import openfl.filters.BitmapFilter;
import openfl.filters.BlurFilter;
import openfl.display.Sprite;

class Filters extends Sprite {
	public function new() {
		super();
		init();
	}

	private function init():Void {
		var sprite:Sprite = new Sprite();
		sprite.graphics.lineStyle(2);
		sprite.graphics.beginFill(0xffff00);
		sprite.graphics.drawRect(100, 100, 100, 100);
		sprite.graphics.endFill();
		addChild(sprite);

		// var blur:BlurFilter = new BlurFilter(5, 5, 3);
		// var filters:Array<BitmapFilter> = new Array<BitmapFilter>();
		// filters.push(blur);
		// sprite.filters = filters;

		// shortcut a little:
		// var blur:BlurFilter = new BlurFilter(5, 5, 3);
		// var filters:Array<BitmapFilter> = [blur];
		// sprite.filters = filters;

		// shortcut a lot:
		// var blur:BlurFilter = new BlurFilter(5, 5, 3);
		// sprite.filters = [blur];

		// bare minimum!
		sprite.filters = [new BlurFilter(5, 5, 3)];
	}
}
