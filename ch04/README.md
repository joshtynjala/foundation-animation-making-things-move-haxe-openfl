# Chapter 4

Sample code translated to [OpenFL](https://openfl.org/) and [Haxe](https://haxe.org/) from **Chapter 4** of [_Foundation ActionScript 3.0 Animation: Making Things Move_](http://www.apress.com/9781590597910) by Keith Peters (Apress, 2007).

> Ported and shared with permission. Thank you, Keith.

## Samples

Several samples from this chapter are available in the _src_ directory.

- _AnimatedFilters.hx_
- _CurveThroughPoint.hx_
- _DrawingApp.hx_
- _DrawingCurves.hx_
- _EmbedAsset1.hx_
- _EmbedAsset2.hx_
- _Filters.hx_
- _GradientFill.hx_
- _LoadAsset1.hx_
- _LoadAsset2.hx_
- _MultiCurves1.hx_
- _MultiCurves2.hx_
- _MultiCurves3.hx_
- _MultiCurves3Filled.hx_
- _MultiFilters.hx_
- _SimpleBitmap.hx_
- _SprayPaint.hx_
- _TransformColor.hx_

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
