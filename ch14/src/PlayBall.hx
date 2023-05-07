import openfl.geom.Point;
import openfl.events.Event;
import openfl.display.StageScaleMode;
import openfl.display.StageAlign;
import openfl.display.Sprite;

class PlayBall extends Sprite {
	private var segments:Array<Segment>;
	private var numSegments:UInt = 6;
	private var gravity:Float = 0.5;
	private var bounce:Float = -0.9;
	private var ball:Ball;

	public function new() {
		super();
		init();
	}

	private function init():Void {
		stage.align = StageAlign.TOP_LEFT;
		stage.scaleMode = StageScaleMode.NO_SCALE;
		ball = new Ball(20);
		ball.vx = 10;
		addChild(ball);
		segments = new Array();
		for (i in 0...numSegments) {
			var segment:Segment = new Segment(50, 10);
			addChild(segment);
			segments.push(segment);
		}
		var segment:Segment = segments[segments.length - 1];
		segment.x = stage.stageWidth / 2;
		segment.y = stage.stageHeight;
		addEventListener(Event.ENTER_FRAME, onEnterFrame);
	}

	private function onEnterFrame(event:Event):Void {
		moveBall();
		var target:Point = reach(segments[0], ball.x, ball.y);
		for (i in 1...numSegments) {
			var segment:Segment = segments[i];
			target = reach(segment, target.x, target.y);
		}
		var i = numSegments - 1;
		while (i > 0) {
			var segmentA:Segment = segments[i];
			var segmentB:Segment = segments[i - 1];
			position(segmentB, segmentA);
			i--;
		}
		checkHit();
	}

	private function reach(segment:Segment, xpos:Float, ypos:Float):Point {
		var dx:Float = xpos - segment.x;
		var dy:Float = ypos - segment.y;
		var angle:Float = Math.atan2(dy, dx);
		segment.rotation = angle * 180 / Math.PI;

		var w:Float = segment.getPin().x - segment.x;
		var h:Float = segment.getPin().y - segment.y;
		var tx:Float = xpos - w;
		var ty:Float = ypos - h;
		return new Point(tx, ty);
	}

	private function position(segmentA:Segment, segmentB:Segment):Void {
		segmentA.x = segmentB.getPin().x;
		segmentA.y = segmentB.getPin().y;
	}

	private function moveBall():Void {
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
	}

	public function checkHit():Void {
		var segment:Segment = segments[0];
		var dx:Float = segment.getPin().x - ball.x;
		var dy:Float = segment.getPin().y - ball.y;
		var dist:Float = Math.sqrt(dx * dx + dy * dy);
		if (dist < ball.radius) {
			ball.vx += Math.random() * 2 - 1;
			ball.vy -= 1;
		}
	}
}
