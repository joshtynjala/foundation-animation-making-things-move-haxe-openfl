import openfl.events.Event;
import openfl.display.StageScaleMode;
import openfl.display.StageAlign;
import openfl.display.Sprite;

class Easing3D extends Sprite {
	private var ball:Ball3D;
	private var tx:Float;
	private var ty:Float;
	private var tz:Float;
	private var easing:Float = .1;
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

		ball = new Ball3D();
		addChild(ball);

		tx = Math.random() * 500 - 250;
		ty = Math.random() * 500 - 250;
		tz = Math.random() * 500;

		addEventListener(Event.ENTER_FRAME, onEnterFrame);
	}

	private function onEnterFrame(event:Event):Void {
		var dx:Float = tx - ball.xpos;
		var dy:Float = ty - ball.ypos;
		var dz:Float = tz - ball.zpos;
		ball.xpos += dx * easing;
		ball.ypos += dy * easing;
		ball.zpos += dz * easing;

		var dist:Float = Math.sqrt(dx * dx + dy * dy + dz * dz);

		if (dist < 1) {
			tx = Math.random() * 500 - 250;
			ty = Math.random() * 500 - 250;
			tz = Math.random() * 500;
		}

		if (ball.zpos > -fl) {
			var scale:Float = fl / (fl + ball.zpos);
			ball.scaleX = ball.scaleY = scale;
			ball.x = vpX + ball.xpos * scale;
			ball.y = vpY + ball.ypos * scale;
			ball.visible = true;
		} else {
			ball.visible = false;
		}
	}
}
