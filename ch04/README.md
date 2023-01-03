# Chapter 4

Sample code translated to [OpenFL](https://openfl.org/) and [Haxe](https://haxe.org/) from **Chapter 4** of [_Foundation ActionScript 3.0 Animation: Making Things Move_](http://www.apress.com/9781590597910) by Keith Peters (Apress, 2007).

> Ported and shared with permission. Thank you, Keith.

## Samples

Several samples from this chapter are available in the _src_ directory.

- [_AnimatedFilters.hx_](src/AnimatedFilters.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch04/AnimatedFilters/index.html)
- [_CurveThroughPoint.hx_](src/CurveThroughPoint.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch04/CurveThroughPoint/index.html)
- [_DrawingApp.hx_](src/DrawingApp.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch04/DrawingApp/index.html)
- [_DrawingCurves.hx_](src/DrawingCurves.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch04/DrawingCurves/index.html)
- [_EmbedAsset1.hx_](src/EmbedAsset1.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch04/EmbedAsset1/index.html)
- [_EmbedAsset2.hx_](src/EmbedAsset2.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch04/EmbedAsset2/index.html)
- [_Filters.hx_](src/Filters.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch04/Filters/index.html)
- [_GradientFill.hx_](src/GradientFill.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch04/GradientFill/index.html)
- [_LoadAsset1.hx_](src/LoadAsset1.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch04/LoadAsset1/index.html)
- [_LoadAsset2.hx_](src/LoadAsset2.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch04/LoadAsset2/index.html)
- [_MultiCurves1.hx_](src/MultiCurves1.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch04/MultiCurves1/index.html)
- [_MultiCurves2.hx_](src/MultiCurves2.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch04/MultiCurves2/index.html)
- [_MultiCurves3.hx_](src/MultiCurves3.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch04/MultiCurves3/index.html)
- [_MultiCurves3Filled.hx_](src/MultiCurves3Filled.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch04/MultiCurves3Filled/index.html)
- [_MultiFilters.hx_](src/MultiFilters.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch04/MultiFilters/index.html)
- [_SimpleBitmap.hx_](src/SimpleBitmap.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch04/SimpleBitmap/index.html)
- [_SprayPaint.hx_](src/SprayPaint.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch04/SprayPaint/index.html)
- [_TransformColor.hx_](src/TransformColor.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch04/TransformColor/index.html)

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
<app main="AnimatedFilters"/>
```

All except one of the samples are commented out:

```xml
<!-- <app main="CurveThroughPoint"/> -->
```

To switch between samples, comment out the currently selected sample, and uncomment a different sample. Then, run `openfl test html5` again.

Alternatively, you can switch between samples without modifying _project.xml_ by specifying the `--app-main` command line option with the sample name.

```sh
openfl test html5 --app-main=DrawingApp
```
