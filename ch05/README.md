# Chapter 5

Sample code translated to [OpenFL](https://openfl.org/) and [Haxe](https://haxe.org/) from **Chapter 5** of [_Foundation ActionScript 3.0 Animation: Making Things Move_](http://www.apress.com/9781590597910) by Keith Peters (Apress, 2007).

> Ported and shared with permission. Thank you, Keith.

## Samples

Several samples from this chapter are available in the _src_ directory.

- [_Acceleration1.hx_](src/Acceleration1.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch05/Acceleration1/index.html)
- [_Acceleration2.hx_](src/Acceleration2.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch05/Acceleration2/index.html)
- [_Acceleration3.hx_](src/Acceleration3.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch05/Acceleration3/index.html)
- [_FollowMouse1.hx_](src/FollowMouse1.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch05/FollowMouse1/index.html)
- [_FollowMouse2.hx_](src/FollowMouse2.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch05/FollowMouse2/index.html)
- [_Gravity.hx_](src/Gravity.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch05/Gravity/index.html)
- [_RotationalVelocity.hx_](src/RotationalVelocity.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch05/RotationalVelocity/index.html)
- [_ShipSim.hx_](src/ShipSim.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch05/ShipSim/index.html)
- [_Velocity1.hx_](src/Velocity1.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch05/Velocity1/index.html)
- [_Velocity2.hx_](src/Velocity2.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch05/Velocity2/index.html)
- [_VelocityAngle.hx_](src/VelocityAngle.hx) — [Demo](https://joshtynjala.github.io/foundation-animation-making-things-move-haxe-openfl/ch05/VelocityAngle/index.html)

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
<app main="Acceleration1"/>
```

All except one of the samples are commented out:

```xml
<!-- <app main="FollowMouse1"/> -->
```

To switch between samples, comment out the currently selected sample, and uncomment a different sample. Then, run `openfl test html5` again.

Alternatively, you can switch between samples without modifying _project.xml_ by specifying the `--app-main` command line option with the sample name.

```sh
openfl test html5 --app-main=FollowMouse1
```
