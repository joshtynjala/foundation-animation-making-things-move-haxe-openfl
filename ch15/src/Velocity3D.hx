import openfl.ui.Keyboard;
import openfl.events.KeyboardEvent;
import openfl.events.Event;
import openfl.display.Sprite;
import openfl.display.StageScaleMode;
import openfl.display.StageAlign;

class Velocity3D extends Sprite {
	private var ball:Ball;
	private var xpos:Float = 0;
	private var ypos:Float = 0;
	private var zpos:Float = 0;
	private var vx:Float = 0;
	private var vy:Float = 0;
	private var vz:Float = 0;
	private var friction:Float = .98;
	private var fl:Float = 250;
	private var vpX:Float;
	private var vpY:Float;

	public function new() {
		super();
		init();
	}

	private function init():Void {
		stage.align = StageAlign.TOP_LEFT;
		stage.scaleMode = StageScaleMode.NO_SCALE;

		vpX = stage.stageWidth / 2;
		vpY = stage.stageHeight / 2;

		ball = new Ball();
		addChild(ball);
		addEventListener(Event.ENTER_FRAME, onEnterFrame);
		stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
	}

	private function onEnterFrame(event:Event):Void {
		xpos += vx;
		ypos += vy;
		zpos += vz;

		vx *= friction;
		vy *= friction;
		vz *= friction;

		if (zpos > -fl) {
			var scale:Float = fl / (fl + zpos);
			ball.scaleX = ball.scaleY = scale;
			ball.x = vpX + xpos * scale;
			ball.y = vpY + ypos * scale;
			ball.visible = true;
		} else {
			ball.visible = false;
		}
	}

	private function onKeyDown(event:KeyboardEvent):Void {
		switch (event.keyCode) {
			case Keyboard.UP:
				vy -= 1;

			case Keyboard.DOWN:
				vy += 1;

			case Keyboard.LEFT:
				vx -= 1;

			case Keyboard.RIGHT:
				vx += 1;

			case Keyboard.SHIFT:
				vz += 1;

			case Keyboard.CONTROL:
				vz -= 1;
		}
	}
}
