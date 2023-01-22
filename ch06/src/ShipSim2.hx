import openfl.ui.Keyboard;
import openfl.events.KeyboardEvent;
import openfl.display.StageAlign;
import openfl.display.StageScaleMode;
import openfl.display.Sprite;
import openfl.events.Event;

class ShipSim2 extends Sprite {
	private var ship:Ship;
	private var vr:Float = 0;
	private var thrust:Float = 0;
	private var vx:Float = 0;
	private var vy:Float = 0;

	public function new() {
		super();
		init();
	}

	private function init():Void {
		stage.scaleMode = StageScaleMode.NO_SCALE;
		stage.align = StageAlign.TOP_LEFT;
		stage.color = 0x000000;
		ship = new Ship();
		addChild(ship);
		ship.x = stage.stageWidth / 2;
		ship.y = stage.stageHeight / 2;
		addEventListener(Event.ENTER_FRAME, onEnterFrame);
		stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
	}

	private function onKeyDown(event:KeyboardEvent):Void {
		switch (event.keyCode) {
			case Keyboard.LEFT:
				vr = -5;

			case Keyboard.RIGHT:
				vr = 5;

			case Keyboard.UP:
				thrust = 0.2;
				ship.draw(true);

			default:
		}
	}

	private function onKeyUp(event:KeyboardEvent):Void {
		vr = 0;
		thrust = 0;
		ship.draw(false);
	}

	private function onEnterFrame(event:Event):Void {
		ship.rotation += vr;
		var angle:Float = ship.rotation * Math.PI / 180;
		var ax:Float = Math.cos(angle) * thrust;
		var ay:Float = Math.sin(angle) * thrust;
		vx += ax;
		vy += ay;
		ship.x += vx;
		ship.y += vy;
		var left:Float = 0;
		var right:Float = stage.stageWidth;
		var top:Float = 0;
		var bottom:Float = stage.stageHeight;
		if (ship.x - ship.width / 2 > right) {
			ship.x = left - ship.width / 2;
		} else if (ship.x + ship.width / 2 < left) {
			ship.x = right + ship.width / 2;
		}
		if (ship.y - ship.height / 2 > bottom) {
			ship.y = top - ship.height / 2;
		} else if (ship.y < top - ship.height / 2) {
			ship.y = bottom + ship.height / 2;
		}
	}
}
