import openfl.display.StageAlign;
import openfl.display.StageScaleMode;
import openfl.events.Event;
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
		var position:Array<Float> = [ball.xpos, ball.ypos, ball.zpos];

		var sin:Float = Math.sin(angleX);
		var cos:Float = Math.cos(angleX);
		var xRotMatrix:Array<Array<Float>> = [];
		xRotMatrix[0] = [1, 0, 0];
		xRotMatrix[1] = [0, cos, sin];
		xRotMatrix[2] = [0, -sin, cos];

		var result:Array<Float> = matrixMultiply(position, xRotMatrix);
		ball.xpos = result[0];
		ball.ypos = result[1];
		ball.zpos = result[2];
	}

	private function rotateY(ball:Ball3D, angleY:Float):Void {
		var position:Array<Float> = [ball.xpos, ball.ypos, ball.zpos];

		var sin:Float = Math.sin(angleY);
		var cos:Float = Math.cos(angleY);
		var yRotMatrix:Array<Array<Float>> = [];
		yRotMatrix[0] = [cos, 0, sin];
		yRotMatrix[1] = [0, 1, 0];
		yRotMatrix[2] = [-sin, 0, cos];

		var result:Array<Float> = matrixMultiply(position, yRotMatrix);
		ball.xpos = result[0];
		ball.ypos = result[1];
		ball.zpos = result[2];
	}

	private function matrixMultiply(matrixA:Array<Float>, matrixB:Array<Array<Float>>):Array<Float> {
		var result:Array<Float> = [];
		result[0] = matrixA[0] * matrixB[0][0] + matrixA[1] * matrixB[1][0] + matrixA[2] * matrixB[2][0];

		result[1] = matrixA[0] * matrixB[0][1] + matrixA[1] * matrixB[1][1] + matrixA[2] * matrixB[2][1];

		result[2] = matrixA[0] * matrixB[0][2] + matrixA[1] * matrixB[1][2] + matrixA[2] * matrixB[2][2];
		return result;
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
