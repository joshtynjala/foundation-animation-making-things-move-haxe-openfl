import openfl.events.Event;
import openfl.filters.DropShadowFilter;
import openfl.display.Sprite;

class AnimatedFilters extends Sprite {
	private var filter:DropShadowFilter;
	private var sprite:Sprite;

	public function new() {
		super();
		init();
	}

	private function init():Void {
		sprite = new Sprite();
		sprite.graphics.lineStyle(2);
		sprite.graphics.beginFill(0xffff00);
		sprite.graphics.drawRect(-50, -50, 100, 100);
		sprite.graphics.endFill();
		sprite.x = 200;
		sprite.y = 200;
		addChild(sprite);

		filter = new DropShadowFilter(0, 0, 0, 1, 20, 20, .3);

		addEventListener(Event.ENTER_FRAME, onEnterFrame);
	}

	private function onEnterFrame(event:Event):Void {
		var dx:Float = mouseX - sprite.x;
		var dy:Float = mouseY - sprite.y;

		filter.distance = -Math.sqrt(dx * dx + dy * dy) / 10;
		filter.angle = Math.atan2(dy, dx) * 180 / Math.PI;
		sprite.filters = [filter];
	}
}
