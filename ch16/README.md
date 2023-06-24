# Chapter 16

Sample code translated to [OpenFL](https://openfl.org/) and [Haxe](https://haxe.org/) from **Chapter 16** of [_Foundation ActionScript 3.0 Animation: Making Things Move_](http://www.apress.com/9781590597910) by Keith Peters (Apress, 2007).

> Ported and shared with permission. Thank you, Keith.

## Samples

Several samples from this chapter are available in the _src_ directory.

- [_Cube.hx_](src/Cube.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch16/Cube/index.html)
- [_Cylinder.hx_](src/Cylinder.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch16/Cylinder/index.html)
- [_ExtrudedA.hx_](src/ExtrudedA.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch16/ExtrudedA/index.html)
- [_FilledE.hx_](src/FilledE.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch16/FilledE/index.html)
- [_Lines3D1.hx_](src/Lines3D1.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch16/Lines3D1/index.html)
- [_Lines3D2.hx_](src/Lines3D2.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch16/Lines3D2/index.html)
- [_MoveCube.hx_](src/MoveCube.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch16/MoveCube/index.html)
- [_MovingCube.hx_](src/MovingCube.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch16/MovingCube/index.html)
- [_Pyramid.hx_](src/Pyramid.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch16/Pyramid/index.html)
- [_SpinningE.hx_](src/SpinningE.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch16/SpinningE/index.html)
- [_Square3D.hx_](src/Square3D.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch16/Square3D/index.html)
- [_Triangles.hx_](src/Triangles.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch16/Triangles/index.html)

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
<app main="Cube"/>
```

All except one of the samples are commented out:

```xml
<!-- <app main="Cylinder"/> -->
```

To switch between samples, comment out the currently selected sample, and uncomment a different sample. Then, run `openfl test html5` again.

Alternatively, you can switch between samples without modifying _project.xml_ by specifying the `--app-main` command line option with the sample name.

```sh
openfl test html5 --app-main=Cylinder
```
