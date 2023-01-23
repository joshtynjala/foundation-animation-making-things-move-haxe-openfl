import openfl.display.Sprite;

class Twips extends Sprite {
	public function new() {
		super();
		init();
	}

	private function init():Void {
		var sprite:Sprite;
		sprite = new Sprite();
		addChild(sprite);
		sprite.x = 0;
		var targ:Float = 100;
		for (i in 0...20) {
			trace(i + ": " + sprite.x);
			sprite.x += (targ - sprite.x) * .5;
		}
	}
}
