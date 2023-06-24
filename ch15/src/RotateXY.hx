import openfl.events.Event;
import openfl.display.StageScaleMode;
import openfl.display.StageAlign;
import openfl.display.Sprite;

class RotateXY extends Sprite {
	private var balls:Array<Ball3D>;
	private var numBalls:UInt = 50;
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

		balls = [];
		for (i in 0...numBalls) {
			var ball:Ball3D = new Ball3D(15);
			balls.push(ball);
			ball.xpos = Math.random() * 200 - 100;
			ball.ypos = Math.random() * 200 - 100;
			ball.zpos = Math.random() * 200 - 100;
			addChild(ball);
		}
		addEventListener(Event.ENTER_FRAME, onEnterFrame);
	}

	private function onEnterFrame(event:Event):Void {
		var angleX:Float = (mouseY - vpY) * .001;
		var angleY:Float = (mouseX - vpX) * .001;
		for (i in 0...numBalls) {
			var ball:Ball3D = balls[i];
			rotateX(ball, angleX);
			rotateY(ball, angleY);
			doPerspective(ball);
		}
		sortZ();
	}

	private function rotateX(ball:Ball3D, angleX:Float):Void {
		var cosX:Float = Math.cos(angleX);
		var sinX:Float = Math.sin(angleX);

		var y1:Float = ball.ypos * cosX - ball.zpos * sinX;
		var z1:Float = ball.zpos * cosX + ball.ypos * sinX;

		ball.ypos = y1;
		ball.zpos = z1;
	}

	private function rotateY(ball:Ball3D, angleY:Float):Void {
		var cosY:Float = Math.cos(angleY);
		var sinY:Float = Math.sin(angleY);

		var x1:Float = ball.xpos * cosY - ball.zpos * sinY;
		var z1:Float = ball.zpos * cosY + ball.xpos * sinY;

		ball.xpos = x1;
		ball.zpos = z1;
	}

	private function doPerspective(ball:Ball3D):Void {
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

	private function sortZ():Void {
		balls.sort((a, b) -> {
			var zposA = a.zpos;
			var zposB = b.zpos;
			if (zposA < zposB) {
				return 1;
			}
			if (zposA > zposB) {
				return -1;
			}
			return 0;
		});
		for (i in 0...numBalls) {
			var ball:Ball3D = balls[i];
			setChildIndex(ball, i);
		}
	}
}
