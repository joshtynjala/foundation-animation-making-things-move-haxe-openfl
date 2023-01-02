import openfl.filters.DropShadowFilter;
import openfl.filters.BlurFilter;
import openfl.filters.BitmapFilter;
import openfl.display.Sprite;

class MultiFilters extends Sprite {
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

		// first filter
		sprite.filters = [new BlurFilter(5, 5, 3)];

		// second filter
		var filters:Array<BitmapFilter> = sprite.filters;
		filters.push(new DropShadowFilter(10, 45, 0, 1, 10, 10, .3));
		sprite.filters = filters;

		// a quicker way
		// sprite.filters = sprite.filters.concat(new BlurFilter(5, 5, 3));
		// sprite.filters = sprite.filters.concat(new DropShadowFilter(10, 45, 0, 1, 10, 10, .3));
	}
}
