# Chapter 7

Sample code translated to [OpenFL](https://openfl.org/) and [Haxe](https://haxe.org/) from **Chapter 7** of [_Foundation ActionScript 3.0 Animation: Making Things Move_](http://www.apress.com/9781590597910) by Keith Peters (Apress, 2007).

> Ported and shared with permission. Thank you, Keith.

## Samples

Several samples from this chapter are available in the _src_ directory.

- [_Drag.hx_](src/Drag.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch07/Drag/index.html)
- [_DragAndMove1.hx_](src/DragAndMove1.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch07/DragAndMove1/index.html)
- [_DragAndMove2.hx_](src/DragAndMove2.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch07/DragAndMove2/index.html)
- [_MouseEvents.hx_](src/MouseEvents.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch07/MouseEvents/index.html)
- [_MouseMoveDrag.hx_](src/MouseMoveDrag.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch07/MouseMoveDrag/index.html)
- [_Throwing.hx_](src/Throwing.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch07/Throwing/index.html)

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
<app main="Drag"/>
```

All except one of the samples are commented out:

```xml
<!-- <app main="DragAndMove1"/> -->
```

To switch between samples, comment out the currently selected sample, and uncomment a different sample. Then, run `openfl test html5` again.

Alternatively, you can switch between samples without modifying _project.xml_ by specifying the `--app-main` command line option with the sample name.

```sh
openfl test html5 --app-main=DragAndMove1
```
