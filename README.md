# odd-target-android

Android target for the [Odd software renderer](https://github.com/dstrekelj/odd) project.

Provides an implementation of the target-specific rendering context and framebuffer.

## Installation

To install both the Odd dependency and this target, run the following commands from your command line:

```
haxelib git odd https://github.com/dstrekelj/odd.git
haxelib git odd-target-android https://github.com/dstrekelj/odd-target-android.git
```

If you don't have git, do the following:

```
haxelib dev odd path/to/downloaded/odd/repository
haxelib dev odd-target-android path/to/downloaded/odd-target-android/repository
```

## Usage

Include the following flags in your project's .hxml file:

```
-lib odd
-lib odd-target-android

-java out/android/
```
