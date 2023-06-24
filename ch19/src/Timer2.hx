import openfl.events.TimerEvent;
import openfl.utils.Timer;
import openfl.display.Sprite;

class Timer2 extends Sprite {
	private var timer:Timer;
	private var ball:Ball;

	public function new() {
		super();
		init();
	}

	private function init():Void {
		stage.frameRate = 1;
		ball = new Ball();
		ball.y = stage.stageHeight / 2;
		ball.vx = 5;
		addChild(ball);
		timer = new Timer(20);
		timer.addEventListener(TimerEvent.TIMER, onTimer);
		timer.start();
	}

	private function onTimer(event:TimerEvent):Void {
		ball.x += ball.vx;
		event.updateAfterEvent();
	}
}
