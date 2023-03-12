import openfl.display.Sprite;
import openfl.display.StageAlign;
import openfl.display.StageScaleMode;
import openfl.events.Event;
import openfl.geom.Point;

class GravityRandom extends Sprite {
	private var particles:Array<Ball>;
	private var numParticles:Int = 30;

	public function new() {
		super();
		init();
	}

	private function init():Void {
		stage.scaleMode = StageScaleMode.NO_SCALE;
		stage.align = StageAlign.TOP_LEFT;
		particles = new Array<Ball>();
		for (i in 0...numParticles) {
			var size:Float = Math.random() * 25 + 5;
			var particle:Ball = new Ball(size);
			particle.x = Math.random() * stage.stageWidth;
			particle.y = Math.random() * stage.stageHeight;
			particle.mass = size;
			addChild(particle);
			particles.push(particle);
		}

		addEventListener(Event.ENTER_FRAME, onEnterFrame);
	}

	private function onEnterFrame(event:Event):Void {
		for (i in 0...numParticles) {
			var particle:Ball = particles[i];
			particle.x += particle.vx;
			particle.y += particle.vy;
		}
		for (i in 0...(numParticles - 1)) {
			var partA:Ball = particles[i];
			for (j in (i + 1)...numParticles) {
				var partB:Ball = particles[j];
				checkCollision(partA, partB);
				gravitate(partA, partB);
			}
		}
	}

	private function gravitate(partA:Ball, partB:Ball):Void {
		var dx:Float = partB.x - partA.x;
		var dy:Float = partB.y - partA.y;
		var distSQ:Float = dx * dx + dy * dy;
		var dist:Float = Math.sqrt(distSQ);
		var force:Float = partA.mass * partB.mass / distSQ;
		var ax:Float = force * dx / dist;
		var ay:Float = force * dy / dist;
		partA.vx += ax / partA.mass;
		partA.vy += ay / partA.mass;
		partB.vx -= ax / partB.mass;
		partB.vy -= ay / partB.mass;
	}

	private function checkCollision(ball0:Ball, ball1:Ball):Void {
		var dx:Float = ball1.x - ball0.x;
		var dy:Float = ball1.y - ball0.y;
		var dist:Float = Math.sqrt(dx * dx + dy * dy);
		if (dist < ball0.radius + ball1.radius) {
			// calculate angle, sine and cosine
			var angle:Float = Math.atan2(dy, dx);
			var sin:Float = Math.sin(angle);
			var cos:Float = Math.cos(angle);

			// rotate ball0's position
			var pos0:Point = new Point(0, 0);

			// rotate ball1's position
			var pos1:Point = rotate(dx, dy, sin, cos, true);

			// rotate ball0's velocity
			var vel0:Point = rotate(ball0.vx, ball0.vy, sin, cos, true);

			// rotate ball1's velocity
			var vel1:Point = rotate(ball1.vx, ball1.vy, sin, cos, true);

			// collision reaction
			var vxTotal:Float = vel0.x - vel1.x;
			vel0.x = ((ball0.mass - ball1.mass) * vel0.x + 2 * ball1.mass * vel1.x) / (ball0.mass + ball1.mass);
			vel1.x = vxTotal + vel0.x;

			// update position
			var absV:Float = Math.abs(vel0.x) + Math.abs(vel1.x);
			var overlap:Float = (ball0.radius + ball1.radius) - Math.abs(pos0.x - pos1.x);
			pos0.x += vel0.x / absV * overlap;
			pos1.x += vel1.x / absV * overlap;

			// rotate positions back
			var pos0F:Point = rotate(pos0.x, pos0.y, sin, cos, false);

			var pos1F:Point = rotate(pos1.x, pos1.y, sin, cos, false);

			// adjust positions to actual screen positions
			ball1.x = ball0.x + pos1F.x;
			ball1.y = ball0.y + pos1F.y;
			ball0.x = ball0.x + pos0F.x;
			ball0.y = ball0.y + pos0F.y;

			// rotate velocities back
			var vel0F:Point = rotate(vel0.x, vel0.y, sin, cos, false);
			var vel1F:Point = rotate(vel1.x, vel1.y, sin, cos, false);
			ball0.vx = vel0F.x;
			ball0.vy = vel0F.y;
			ball1.vx = vel1F.x;
			ball1.vy = vel1F.y;
		}
	}

	private function rotate(x:Float, y:Float, sin:Float, cos:Float, reverse:Bool):Point {
		var result:Point = new Point();
		if (reverse) {
			result.x = x * cos + y * sin;
			result.y = y * cos - x * sin;
		} else {
			result.x = x * cos - y * sin;
			result.y = y * cos + x * sin;
		}
		return result;
	}
}
