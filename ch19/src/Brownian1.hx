import openfl.events.Event;
import openfl.display.Sprite;

class Brownian1 extends Sprite {
	private var numDots:UInt = 50;
	private var friction:Float = 0.95;
	private var dots:Array<Ball>;

	public function new() {
		super();
		init();
	}

	private function init():Void {
		dots = [];
		for (i in 0...numDots) {
			var dot:Ball = new Ball(1, 0);
			dot.x = Math.random() * stage.stageWidth;
			dot.y = Math.random() * stage.stageHeight;
			dot.vx = 0;
			dot.vy = 0;
			addChild(dot);
			dots.push(dot);
		}
		addEventListener(Event.ENTER_FRAME, onEnterFrame);
	}

	private function onEnterFrame(event:Event):Void {
		for (i in 0...numDots) {
			var dot:Ball = dots[i];
			dot.vx += Math.random() * 0.2 - 0.1;
			dot.vy += Math.random() * 0.2 - 0.1;
			dot.x += dot.vx;
			dot.y += dot.vy;
			dot.vx *= friction;
			dot.vy *= friction;

			if (dot.x > stage.stageWidth) {
				dot.x = 0;
			} else if (dot.x < 0) {
				dot.x = stage.stageWidth;
			}
			if (dot.y > stage.stageHeight) {
				dot.y = 0;
			} else if (dot.y < 0) {
				dot.y = stage.stageHeight;
			}
		}
	}
}
