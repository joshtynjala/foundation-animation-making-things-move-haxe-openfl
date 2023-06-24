import openfl.events.Event;
import openfl.events.KeyboardEvent;
import openfl.ui.Keyboard;
import openfl.display.StageScaleMode;
import openfl.display.StageAlign;
import openfl.display.Sprite;

class Trees2 extends Sprite {
	private var trees:Array<Tree>;
	private var numTrees:UInt = 100;
	private var fl:Float = 250;
	private var vpX:Float;
	private var vpY:Float;
	private var floor:Float = 50;
	private var ax:Float = 0;
	private var ay:Float = 0;
	private var az:Float = 0;
	private var vx:Float = 0;
	private var vy:Float = 0;
	private var vz:Float = 0;
	private var gravity:Float = 0.3;
	private var friction:Float = 0.98;

	public function new() {
		super();
		init();
	}

	private function init():Void {
		stage.align = StageAlign.TOP_LEFT;
		stage.scaleMode = StageScaleMode.NO_SCALE;
		stage.color = 0x000000;

		vpX = stage.stageWidth / 2;
		vpY = stage.stageHeight / 2;

		trees = [];
		for (i in 0...numTrees) {
			var tree:Tree = new Tree();
			trees.push(tree);
			tree.xpos = Math.random() * 2000 - 1000;
			tree.ypos = floor;
			tree.zpos = Math.random() * 10000;
			addChild(tree);
		}
		addEventListener(Event.ENTER_FRAME, onEnterFrame);
		stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		stage.addEventListener(KeyboardEvent.KEY_UP, onKeyUp);
	}

	private function onEnterFrame(event:Event):Void {
		vx += ax;
		vy += ay;
		vz += az;
		vy -= gravity;
		for (i in 0...numTrees) {
			var tree:Tree = trees[i];
			move(tree);
		}
		vx *= friction;
		vy *= friction;
		vz *= friction;
		sortZ();
	}

	private function onKeyDown(event:KeyboardEvent):Void {
		switch (event.keyCode) {
			case Keyboard.UP:
				az = -1;

			case Keyboard.DOWN:
				az = 1;

			case Keyboard.LEFT:
				ax = 1;

			case Keyboard.RIGHT:
				ax = -1;

			case Keyboard.SPACE:
				ay = 1;

			default:
		}
	}

	private function onKeyUp(event:KeyboardEvent):Void {
		switch (event.keyCode) {
			case Keyboard.UP | Keyboard.DOWN:
				az = 0;

			case Keyboard.LEFT | Keyboard.RIGHT:
				ax = 0;

			case Keyboard.SPACE:
				ay = 0;
		}
	}

	private function move(tree:Tree):Void {
		tree.xpos += vx;
		tree.ypos += vy;
		tree.zpos += vz;

		if (tree.ypos < floor) {
			tree.ypos = floor;
		}

		if (tree.zpos < -fl) {
			tree.zpos += 10000;
		}
		if (tree.zpos > 10000 - fl) {
			tree.zpos -= 10000;
		}

		var scale:Float = fl / (fl + tree.zpos);
		tree.scaleX = tree.scaleY = scale;
		tree.x = vpX + tree.xpos * scale;
		tree.y = vpY + tree.ypos * scale;
		tree.alpha = scale;
	}

	private function sortZ():Void {
		trees.sort((a, b) -> {
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
		for (i in 0...numTrees) {
			var tree:Tree = trees[i];
			setChildIndex(tree, i);
		}
	}
}
