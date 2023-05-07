import openfl.geom.Point;
import openfl.display.Sprite;

class Segment extends Sprite {
	private var color:UInt;
	private var segmentWidth:Float;
	private var segmentHeight:Float;

	public var vx:Float = 0;
	public var vy:Float = 0;

	public function new(segmentWidth:Float, segmentHeight:Float, color:UInt = 0xffffff) {
		super();
		this.segmentWidth = segmentWidth;
		this.segmentHeight = segmentHeight;
		this.color = color;
		init();
	}

	public function init():Void {
		// draw the segment itself
		graphics.lineStyle(0);
		graphics.beginFill(color);
		graphics.drawRoundRect(-segmentHeight / 2, -segmentHeight / 2, segmentWidth + segmentHeight, segmentHeight, segmentHeight, segmentHeight);
		graphics.endFill();

		// draw the two "pins"
		graphics.drawCircle(0, 0, 2);
		graphics.drawCircle(segmentWidth, 0, 2);
	}

	public function getPin():Point {
		var angle:Float = rotation * Math.PI / 180;
		var xPos:Float = x + Math.cos(angle) * segmentWidth;
		var yPos:Float = y + Math.sin(angle) * segmentWidth;
		return new Point(xPos, yPos);
	}
}
