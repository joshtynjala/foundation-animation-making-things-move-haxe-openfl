# Chapter 9

Sample code translated to [OpenFL](https://openfl.org/) and [Haxe](https://haxe.org/) from **Chapter 9** of [_Foundation ActionScript 3.0 Animation: Making Things Move_](http://www.apress.com/9781590597910) by Keith Peters (Apress, 2007).

> Ported and shared with permission. Thank you, Keith.

## Samples

Several samples from this chapter are available in the _src_ directory.

> ⚠️ **Hey!** For several of the demos in this chapter, you will need to open your web browser's debug console to see the expected output.

- [_Boxes.hx_](src/Boxes.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch09/Boxes/index.html)
- [_Bubbles1.hx_](src/Bubbles1.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch09/Bubbles1/index.html)
- [_Bubbles2.hx_](src/Bubbles2.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch09/Bubbles2/index.html)
- [_Distance1.hx_](src/Distance1.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch09/Distance1/index.html)
- [_Distance2.hx_](src/Distance2.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch09/Distance2/index.html)
- [_ObjectHitTest.hx_](src/ObjectHitTest.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch09/ObjectHitTest/index.html)
- [_PointHitTest.hx_](src/PointHitTest.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch09/PointHitTest/index.html)
- [_ShapeFlag.hx_](src/ShapeFlag.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch09/ShapeFlag/index.html)

## Requirements

- [Haxe](https://haxe.org/download/)
- [OpenFL](https://openfl.org/download/)

## Build & Run

This directory contains an OpenFL project. The _project.xml_ file specifies the project's configuration options, and the Haxe source code appears in the _src_ directory.

To run this project, open a terminal in this directory, and run the following command:

```sh
openfl test html5
```

The _project.xml_ file contains a line for each sample, like this:

```xml
<app main="Boxes"/>
```

All except one of the samples are commented out:

```xml
<!-- <app main="Bubbles1"/> -->
```

To switch between samples, comment out the currently selected sample, and uncomment a different sample. Then, run `openfl test html5` again.

Alternatively, you can switch between samples without modifying _project.xml_ by specifying the `--app-main` command line option with the sample name.

```sh
openfl test html5 --app-main=Bubbles1
```
