import openfl.events.Event;
import openfl.display.StageAlign;
import openfl.display.StageScaleMode;
import openfl.display.Sprite;

class NodeGarden extends Sprite {
	private var particles:Array<Ball>;
	private var numParticles:Int = 30;
	private var minDist:Float = 100;
	private var springAmount:Float = .001;

	public function new() {
		super();
		init();
	}

	private function init():Void {
		stage.color = 0x000000;
		stage.scaleMode = StageScaleMode.NO_SCALE;
		stage.align = StageAlign.TOP_LEFT;
		particles = new Array<Ball>();
		for (i in 0...numParticles) {
			var particle:Ball = new Ball(5, 0xffffff);
			particle.x = Math.random() * stage.stageWidth;
			particle.y = Math.random() * stage.stageHeight;
			particle.vx = Math.random() * 6 - 3;
			particle.vy = Math.random() * 6 - 3;
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
			if (particle.x > stage.stageWidth) {
				particle.x = 0;
			} else if (particle.x < 0) {
				particle.x = stage.stageWidth;
			}
			if (particle.y > stage.stageHeight) {
				particle.y = 0;
			} else if (particle.y < 0) {
				particle.y = stage.stageHeight;
			}
		}

		for (i in 0...(numParticles - 1)) {
			var partA:Ball = particles[i];
			for (j in (i + 1)...numParticles) {
				var partB:Ball = particles[j];
				spring(partA, partB);
			}
		}
	}

	private function spring(partA:Ball, partB:Ball):Void {
		var dx:Float = partB.x - partA.x;
		var dy:Float = partB.y - partA.y;
		var dist:Float = Math.sqrt(dx * dx + dy * dy);
		if (dist < minDist) {
			var ax:Float = dx * springAmount;
			var ay:Float = dy * springAmount;
			partA.vx += ax;
			partA.vy += ay;
			partB.vx -= ax;
			partB.vy -= ay;
		}
	}
}
