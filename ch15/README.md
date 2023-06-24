# Chapter 15

Sample code translated to [OpenFL](https://openfl.org/) and [Haxe](https://haxe.org/) from **Chapter 15** of [_Foundation ActionScript 3.0 Animation: Making Things Move_](http://www.apress.com/9781590597910) by Keith Peters (Apress, 2007).

> Ported and shared with permission. Thank you, Keith.

## Samples

Several samples from this chapter are available in the _src_ directory.

- [_Bounce3D.hx_](src/Bounce3D.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch15/Bounce3D/index.html)
- [_Collision3D.hx_](src/Collision3D.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch15/Collision3D/index.html)
- [_Easing3D.hx_](src/Easing3D.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch15/Easing3D/index.html)
- [_Fireworks.hx_](src/Fireworks.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch15/Fireworks/index.html)
- [_MultiBounce3D.hx_](src/MultiBounce3D.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch15/MultiBounce3D/index.html)
- [_Perspective1.hx_](src/Perspective1.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch15/Perspective1/index.html)
- [_Perspective2.hx_](src/Perspective2.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch15/Perspective2/index.html)
- [_RotateX.hx_](src/RotateX.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch15/RotateX/index.html)
- [_RotateXY.hx_](src/RotateXY.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch15/RotateXY/index.html)
- [_RotateY.hx_](src/RotateY.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch15/RotateY/index.html)
- [_Spring3D.hx_](src/Spring3D.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch15/Spring3D/index.html)
- [_Trees1.hx_](src/Trees1.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch15/Trees1/index.html)
- [_Trees2.hx_](src/Trees2.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch15/Trees2/index.html)
- [_Velocity3D.hx_](src/Velocity3D.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch15/Velocity3D/index.html)
- [_Zsort.hx_](src/Zsort.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch15/Zsort/index.html)

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
<app main="Bounce3D"/>
```

All except one of the samples are commented out:

```xml
<!-- <app main="Collision3D"/> -->
```

To switch between samples, comment out the currently selected sample, and uncomment a different sample. Then, run `openfl test html5` again.

Alternatively, you can switch between samples without modifying _project.xml_ by specifying the `--app-main` command line option with the sample name.

```sh
openfl test html5 --app-main=Collision3D
```
