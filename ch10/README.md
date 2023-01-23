# Chapter 10

Sample code translated to [OpenFL](https://openfl.org/) and [Haxe](https://haxe.org/) from **Chapter 10** of [_Foundation ActionScript 3.0 Animation: Making Things Move_](http://www.apress.com/9781590597910) by Keith Peters (Apress, 2007).

> Ported and shared with permission. Thank you, Keith.

## Samples

Several samples from this chapter are available in the _src_ directory.

- [_AngleBounce.hx_](src/AngleBounce.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch10/AngleBounce/index.html)
- [_AngleBounceBounds.hx_](src/AngleBounceBounds.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch10/AngleBounceBounds/index.html)
- [_AngleBounceFinal.hx_](src/AngleBounceFinal.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch10/AngleBounceFinal/index.html)
- [_AngleBounceOpt.hx_](src/AngleBounceOpt.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch10/AngleBounceOpt/index.html)
- [_AngleBounceRotate.hx_](src/AngleBounceRotate.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch10/AngleBounceRotate/index.html)
- [_MultiAngleBounce.hx_](src/MultiAngleBounce.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch10/MultiAngleBounce/index.html)
- [_Rotate1.hx_](src/Rotate1.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch10/Rotate1/index.html)
- [_Rotate2.hx_](src/Rotate2.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch10/Rotate2/index.html)
- [_Rotate3.hx_](src/Rotate3.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch10/Rotate3/index.html)

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
<app main="AngleBounce"/>
```

All except one of the samples are commented out:

```xml
<!-- <app main="AngleBounceBounds"/> -->
```

To switch between samples, comment out the currently selected sample, and uncomment a different sample. Then, run `openfl test html5` again.

Alternatively, you can switch between samples without modifying _project.xml_ by specifying the `--app-main` command line option with the sample name.

```sh
openfl test html5 --app-main=AngleBounceBounds
```
