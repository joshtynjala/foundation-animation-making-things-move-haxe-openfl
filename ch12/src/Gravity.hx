import openfl.events.Event;
import openfl.display.StageAlign;
import openfl.display.StageScaleMode;
import openfl.display.Sprite;

class Gravity extends Sprite {
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
			var particle:Ball = new Ball(5);
			particle.x = Math.random() * stage.stageWidth;
			particle.y = Math.random() * stage.stageHeight;
			particle.mass = 1;
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
}
