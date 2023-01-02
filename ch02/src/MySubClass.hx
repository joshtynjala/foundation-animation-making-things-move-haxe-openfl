class MySubClass extends MyBaseClass {
	public function new() {
		super();
	}

	override public function sayHello():Void {
		trace("Hola from MySubClass");
	}

	public function sayGoodbye():Void {
		trace("Goodbye from MySubClass");
	}
}
