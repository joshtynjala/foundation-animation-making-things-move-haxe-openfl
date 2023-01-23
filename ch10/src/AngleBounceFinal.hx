import openfl.display.StageAlign;
import openfl.display.StageScaleMode;
import openfl.display.Sprite;
import openfl.events.Event;
import openfl.geom.Rectangle;

class AngleBounceFinal extends Sprite {
	private var ball:Ball;
	private var line:Sprite;
	private var gravity:Float = 0.3;
	private var bounce:Float = -0.6;

	public function new() {
		super();
		init();
	}

	private function init():Void {
		stage.scaleMode = StageScaleMode.NO_SCALE;
		stage.align = StageAlign.TOP_LEFT;
		ball = new Ball();
		addChild(ball);
		ball.x = 100;
		ball.y = 100;

		line = new Sprite();
		line.graphics.lineStyle(1);
		line.graphics.lineTo(300, 0);
		addChild(line);
		line.x = 50;
		line.y = 200;
		line.rotation = 30;

		addEventListener(Event.ENTER_FRAME, onEnterFrame);
	}

	private function onEnterFrame(event:Event):Void {
		line.rotation = (stage.stageWidth / 2 - mouseX) * .1;

		// normal motion code
		ball.vy += gravity;
		ball.x += ball.vx;
		ball.y += ball.vy;

		if (ball.x + ball.radius > stage.stageWidth) {
			ball.x = stage.stageWidth - ball.radius;
			ball.vx *= bounce;
		} else if (ball.x - ball.radius < 0) {
			ball.x = ball.radius;
			ball.vx *= bounce;
		}
		if (ball.y + ball.radius > stage.stageHeight) {
			ball.y = stage.stageHeight - ball.radius;
			ball.vy *= bounce;
		} else if (ball.y - ball.radius < 0) {
			ball.y = ball.radius;
			ball.vy *= bounce;
		}

		var bounds:Rectangle = line.getBounds(this);
		if (ball.x > bounds.left && ball.x < bounds.right) {
			// get angle, sine and cosine
			var angle:Float = line.rotation * Math.PI / 180;
			var cos:Float = Math.cos(angle);
			var sin:Float = Math.sin(angle);

			// get position of ball, relative to line
			var x1:Float = ball.x - line.x;
			var y1:Float = ball.y - line.y;

			// rotate coordinates
			var y2:Float = cos * y1 - sin * x1;

			// rotate velocity
			var vy1:Float = cos * ball.vy - sin * ball.vx;

			// perform bounce with rotated values
			if (y2 > -ball.height / 2 && y2 < vy1) {
				// rotate coordinates
				var x2:Float = cos * x1 + sin * y1;

				// rotate velocity
				var vx1:Float = cos * ball.vx + sin * ball.vy;

				y2 = -ball.height / 2;
				vy1 *= bounce;

				// rotate everything back;
				x1 = cos * x2 - sin * y2;
				y1 = cos * y2 + sin * x2;
				ball.vx = cos * vx1 - sin * vy1;
				ball.vy = cos * vy1 + sin * vx1;
				ball.x = line.x + x1;
				ball.y = line.y + y1;
			}
		}
	}
}
