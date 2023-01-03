# Chapter 3

Sample code translated to [OpenFL](https://openfl.org/) and [Haxe](https://haxe.org/) from **Chapter 3** of [_Foundation ActionScript 3.0 Animation: Making Things Move_](http://www.apress.com/9781590597910) by Keith Peters (Apress, 2007).

> Ported and shared with permission. Thank you, Keith.

## Samples

Several samples from this chapter are available in the _src_ directory.

- [_Bobbing.hx_](src/Bobbing.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch03/Bobbing/index.html)
- [_Circle.hx_](src/Circle.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch03/Circle/index.html)
- [_Distance.hx_](src/Distance.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch03/Distance/index.html)
- [_MouseDistance.hx_](src/MouseDistance.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch03/MouseDistance/index.html)
- [_Oval.hx_](src/Oval.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch03/Oval/index.html)
- [_Pulse.hx_](src/Pulse.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch03/Pulse/index.html)
- [_Random.hx_](src/Random.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch03/Random/index.html)
- [_RotateToMouse.hx_](src/RotateToMouse.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch03/RotateToMouse/index.html)
- [_Wave1.hx_](src/Wave1.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch03/Wave1/index.html)
- [_Wave2.hx_](src/Wave2.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch03/Wave2/index.html)

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
<app main="RotateToMouse"/>
```

All except one of the samples are commented out:

```xml
<!-- <app main="Pulse"/> -->
```

To switch between samples, comment out the currently selected sample, and uncomment a different sample. Then, run `openfl test html5` again.

Alternatively, you can switch between samples without modifying _project.xml_ by specifying the `--app-main` command line option with the sample name.

```sh
openfl test html5 --app-main=Wave1
```
