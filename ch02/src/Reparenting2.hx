import openfl.events.MouseEvent;
import openfl.display.Sprite;

class Reparenting2 extends Sprite {
	private var parent1:ParentBox;
	private var parent2:ParentBox;
	private var ball:Sprite;

	public function new() {
		super();
		init();
	}

	private function init():Void {
		parent1 = new ParentBox();
		addChild(parent1);
		parent1.x = 60;
		parent1.y = 60;

		parent2 = new ParentBox();
		addChild(parent2);
		parent2.x = 170;
		parent2.y = 60;

		ball = new Sprite();
		parent1.addChild(ball);
		ball.graphics.beginFill(0xff0000);
		ball.graphics.drawCircle(0, 0, 40);
		ball.addEventListener(MouseEvent.CLICK, onBallClick);
	}

	public function onBallClick(event:MouseEvent):Void {
		parent2.addChild(ball);
	}
}
