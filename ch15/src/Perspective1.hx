import openfl.ui.Keyboard;
import openfl.events.KeyboardEvent;
import openfl.events.Event;
import openfl.display.StageScaleMode;
import openfl.display.StageAlign;
import openfl.display.Sprite;

class Perspective1 extends Sprite {
	private var ball:Ball;
	private var xpos:Float = 0;
	private var ypos:Float = 0;
	private var zpos:Float = 0;
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
		xpos = mouseX - vpX;
		ypos = mouseY - vpY;
		var scale:Float = fl / (fl + zpos);
		ball.scaleX = ball.scaleY = scale;
		ball.x = vpX + xpos * scale;
		ball.y = vpY + ypos * scale;
	}

	private function onKeyDown(event:KeyboardEvent):Void {
		if (event.keyCode == Keyboard.UP) {
			zpos += 5;
		} else if (event.keyCode == Keyboard.DOWN) {
			zpos -= 5;
		}
	}
}
