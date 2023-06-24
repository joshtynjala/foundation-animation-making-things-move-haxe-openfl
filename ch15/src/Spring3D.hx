import openfl.events.MouseEvent;
import openfl.events.Event;
import openfl.display.StageScaleMode;
import openfl.display.StageAlign;
import openfl.display.Sprite;

class Spring3D extends Sprite {
	private var ball:Ball3D;
	private var tx:Float;
	private var ty:Float;
	private var tz:Float;
	private var spring:Float = .1;
	private var friction:Float = .94;
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
		stage.addEventListener(MouseEvent.MOUSE_DOWN, onMouseDown);
	}

	private function onEnterFrame(event:Event):Void {
		var dx:Float = tx - ball.xpos;
		var dy:Float = ty - ball.ypos;
		var dz:Float = tz - ball.zpos;
		ball.vx += dx * spring;
		ball.vy += dy * spring;
		ball.vz += dz * spring;
		ball.xpos += ball.vx;
		ball.ypos += ball.vy;
		ball.zpos += ball.vz;
		ball.vx *= friction;
		ball.vy *= friction;
		ball.vz *= friction;

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

	private function onMouseDown(event:MouseEvent):Void {
		tx = Math.random() * 500 - 250;
		ty = Math.random() * 500 - 250;
		tz = Math.random() * 500;
	}
}
