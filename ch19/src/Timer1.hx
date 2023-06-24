import openfl.utils.Timer;
import openfl.display.Sprite;
import openfl.events.TimerEvent;

class Timer1 extends Sprite {
	private var timer:Timer;

	public function new() {
		super();
		init();
	}

	private function init():Void {
		timer = new Timer(30);
		timer.addEventListener(TimerEvent.TIMER, onTimer);
		timer.start();
	}

	private function onTimer(timer:TimerEvent):Void {
		trace("timer!");
	}
}
