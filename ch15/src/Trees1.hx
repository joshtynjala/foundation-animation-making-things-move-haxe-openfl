import openfl.events.Event;
import openfl.display.StageAlign;
import openfl.display.StageScaleMode;
import openfl.events.KeyboardEvent;
import openfl.ui.Keyboard;
import openfl.display.Sprite;

class Trees1 extends Sprite {
	private var trees:Array<Tree>;
	private var numTrees:UInt = 100;
	private var fl:Float = 250;
	private var vpX:Float;
	private var vpY:Float;
	private var floor:Float = 50;
	private var vz:Float = 0;
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
	}

	private function onEnterFrame(event:Event):Void {
		for (i in 0...numTrees) {
			var tree:Tree = trees[i];
			move(tree);
		}
		vz *= friction;
		sortZ();
	}

	private function onKeyDown(event:KeyboardEvent):Void {
		if (event.keyCode == Keyboard.UP) {
			vz -= 1;
		} else if (event.keyCode == Keyboard.DOWN) {
			vz += 1;
		}
	}

	private function move(tree:Tree):Void {
		tree.zpos += vz;

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
