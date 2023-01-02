import openfl.display.StageAlign;
import openfl.display.StageScaleMode;
import openfl.display.Sprite;

class App extends Sprite {
	public function new() {
		super();
		init();
	}

	private function init():Void {
		stage.scaleMode = StageScaleMode.NO_SCALE;
		stage.align = StageAlign.TOP_LEFT;
		var base:MyBaseClass = new MyBaseClass();
		base.sayHello();

		var sub:MySubClass = new MySubClass();
		sub.sayHello();
		sub.sayGoodbye();
	}
}
