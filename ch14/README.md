# Chapter 14

Sample code translated to [OpenFL](https://openfl.org/) and [Haxe](https://haxe.org/) from **Chapter 14** of [_Foundation ActionScript 3.0 Animation: Making Things Move_](http://www.apress.com/9781590597910) by Keith Peters (Apress, 2007).

> Ported and shared with permission. Thank you, Keith.

## Samples

Several samples from this chapter are available in the _src_ directory.

- [_Cosines.hx_](src/Cosines.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch14/Cosines/index.html)
- [_OneSegment.hx_](src/OneSegment.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch14/OneSegment/index.html)
- [_OneSegmentDrag.hx_](src/OneSegmentDrag.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch14/OneSegmentDrag/index.html)
- [_TwoSegmentDrag.hx_](src/TwoSegmentDrag.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch14/TwoSegmentDrag/index.html)
- [_TwoSegmentReach.hx_](src/TwoSegmentReach.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch14/TwoSegmentReach/index.html)
- [_MultiSegmentDrag.hx_](src/MultiSegmentDrag.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch14/MultiSegmentDrag/index.html)
- [_MultiSegmentReach.hx_](src/MultiSegmentReach.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch14/MultiSegmentReach/index.html)
- [_PlayBall.hx_](src/PlayBall.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch14/PlayBall/index.html)

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
<app main="Cosines"/>
```

All except one of the samples are commented out:

```xml
<!-- <app main="OneSegmentDrag"/> -->
```

To switch between samples, comment out the currently selected sample, and uncomment a different sample. Then, run `openfl test html5` again.

Alternatively, you can switch between samples without modifying _project.xml_ by specifying the `--app-main` command line option with the sample name.

```sh
openfl test html5 --app-main=OneSegmentDrag
```
