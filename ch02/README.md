# Chapter 2

Sample code translated to [OpenFL](https://openfl.org/) and [Haxe](https://haxe.org/) from **Chapter 2** of [_Foundation ActionScript 3.0 Animation: Making Things Move_](http://www.apress.com/9781590597910) by Keith Peters (Apress, 2007).

> Ported and shared with permission. Thank you, Keith.

## Samples

Several samples from this chapter are available in the _src_ directory.

- [_App.hx_](src/App.hx) | [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch02/App/index.html)
- [_EventDemo.hx_](src/EventDemo.hx) | [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch02/EventDemo/index.html)
- [_FirstAnimation.hx_](src/FirstAnimation.hx) | [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch02/FirstAnimation/index.html)
- [_KeyboardEvents.hx_](src/KeyboardEvents.hx) | [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch02/KeyboardEvents/index.html)
- [_KeyCodes.hx_](src/KeyCodes.hx) | [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch02/KeyCodes/index.html)
- [_MouseEvents.hx_](src/MouseEvents.hx) | [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch02/MouseEvents/index.html)
- [_MousePos.hx_](src/MousePos.hx) | [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch02/MousePos/index.html)
- [_Reparenting.hx_](src/Reparenting.hx) | [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch02/Reparenting/index.html)
- [_Reparenting2.hx_](src/Reparenting2.hx) | [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch02/Reparenting2/index.html)

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
<app main="FirstAnimation"/>
```

All except one of the samples are commented out:

```xml
<!-- <app main="KeyCodes"/> -->
```

To switch between samples, comment out the currently selected sample, and uncomment a different sample. Then, run `openfl test html5` again.

Alternatively, you can switch between samples without modifying _project.xml_ by specifying the `--app-main` command line option with the sample name.

```sh
openfl test html5 --app-main=MousePos
```
