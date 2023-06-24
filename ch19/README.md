# Chapter 19

Sample code translated to [OpenFL](https://openfl.org/) and [Haxe](https://haxe.org/) from **Chapter 19** of [_Foundation ActionScript 3.0 Animation: Making Things Move_](http://www.apress.com/9781590597910) by Keith Peters (Apress, 2007).

> Ported and shared with permission. Thank you, Keith.

## Samples

Several samples from this chapter are available in the _src_ directory.

- [_Brownian1.hx_](src/Brownian1.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch19/Brownian1/index.html)
- [_Brownian2.hx_](src/Brownian2.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch19/Brownian2/index.html)
- [_Random1.hx_](src/Random1.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch19/Random1/index.html)
- [_Random2.hx_](src/Random2.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch19/Random2/index.html)
- [_Random3.hx_](src/Random3.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch19/Random3/index.html)
- [_Random4.hx_](src/Random4.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch19/Random4/index.html)
- [_Random5.hx_](src/Random5.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch19/Random5/index.html)
- [_Random6.hx_](src/Random6.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch19/Random6/index.html)
- [_Random7.hx_](src/Random7.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch19/Random7/index.html)
- [_SameMass.hx_](src/SameMass.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch19/SameMass/index.html)
- [_SoundEvents.hx_](src/SoundEvents.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch19/SoundEvents/index.html)
- [_TimeBased.hx_](src/TimeBased.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch19/TimeBased/index.html)
- [_Timer1.hx_](src/Timer1.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch19/Timer1/index.html)
- [_Timer2.hx_](src/Timer2.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch19/Timer2/index.html)

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
<app main="Brownian1"/>
```

All except one of the samples are commented out:

```xml
<!-- <app main="Brownian2"/> -->
```

To switch between samples, comment out the currently selected sample, and uncomment a different sample. Then, run `openfl test html5` again.

Alternatively, you can switch between samples without modifying _project.xml_ by specifying the `--app-main` command line option with the sample name.

```sh
openfl test html5 --app-main=Brownian2
```
