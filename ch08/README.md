# Chapter 8

Sample code translated to [OpenFL](https://openfl.org/) and [Haxe](https://haxe.org/) from **Chapter 8** of [_Foundation ActionScript 3.0 Animation: Making Things Move_](http://www.apress.com/9781590597910) by Keith Peters (Apress, 2007).

> Ported and shared with permission. Thank you, Keith.

## Samples

Several samples from this chapter are available in the _src_ directory.

- [_Chain.hx_](src/Chain.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch08/Chain/index.html)
- [_ChainArray.hx_](src/ChainArray.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch08/ChainArray/index.html)
- [_DoubleSpring.hx_](src/DoubleSpring.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch08/DoubleSpring/index.html)
- [_EaseToMouse.hx_](src/EaseToMouse.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch08/EaseToMouse/index.html)
- [_Easing1.hx_](src/Easing1.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch08/Easing1/index.html)
- [_Easing2.hx_](src/Easing2.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch08/Easing2/index.html)
- [_EasingOff.hx_](src/EasingOff.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch08/EasingOff/index.html)
- [_MultiSpring.hx_](src/MultiSpring.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch08/MultiSpring/index.html)
- [_OffsetSpring.hx_](src/OffsetSpring.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch08/OffsetSpring/index.html)
- [_Spring1.hx_](src/Spring1.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch08/Spring1/index.html)
- [_Spring2.hx_](src/Spring2.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch08/Spring2/index.html)
- [_Spring3.hx_](src/Spring3.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch08/Spring3/index.html)
- [_Spring4.hx_](src/Spring4.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch08/Spring4/index.html)
- [_Spring5.hx_](src/Spring5.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch08/Spring5/index.html)
- [_TripleSpring.hx_](src/TripleSpring.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch08/TripleSpring/index.html)
- [_Twips.hx_](src/Twips.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch08/Twips/index.html)

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
<app main="Chain"/>
```

All except one of the samples are commented out:

```xml
<!-- <app main="ChainArray"/> -->
```

To switch between samples, comment out the currently selected sample, and uncomment a different sample. Then, run `openfl test html5` again.

Alternatively, you can switch between samples without modifying _project.xml_ by specifying the `--app-main` command line option with the sample name.

```sh
openfl test html5 --app-main=ChainArray
```
