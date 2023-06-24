import openfl.events.Event;
import openfl.display.StageScaleMode;
import openfl.display.StageAlign;
import openfl.display.Sprite;

class Fireworks extends Sprite {
	private var balls:Array<Ball3D>;
	private var numBalls:UInt = 100;
	private var fl:Float = 250;
	private var vpX:Float;
	private var vpY:Float;
	private var gravity:Float = 0.2;
	private var floor:Float = 200;
	private var bounce:Float = -0.6;

	public function new() {
		super();
		init();
	}

	private function init():Void {
		stage.align = StageAlign.TOP_LEFT;
		stage.scaleMode = StageScaleMode.NO_SCALE;
		stage.color = 0x000000;

		vpX = stage.stageWidth / 2;
		vpY = stage.stageHeight / 2;

		balls = [];
		for (i in 0...numBalls) {
			var ball:Ball3D = new Ball3D(3, Std.int(Math.random() * 0xffffff));
			balls.push(ball);
			ball.ypos = -100;
			ball.vx = Math.random() * 6 - 3;
			ball.vy = Math.random() * 6 - 6;
			ball.vz = Math.random() * 6 - 3;
			addChild(ball);
		}
		addEventListener(Event.ENTER_FRAME, onEnterFrame);
	}

	private function onEnterFrame(event:Event):Void {
		for (i in 0...numBalls) {
			var ball:Ball3D = balls[i];
			move(ball);
		}
		sortZ();
	}

	private function move(ball:Ball3D):Void {
		var radius:Float = ball.radius;

		ball.vy += gravity;
		ball.xpos += ball.vx;
		ball.ypos += ball.vy;
		ball.zpos += ball.vz;

		if (ball.ypos > floor) {
			ball.ypos = floor;
			ball.vy *= bounce;
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
