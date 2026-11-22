# Linenoise

[Linenoise](https://github.com/antirez/linenoise/tree/master) packaged for zig


## Start

```console
zig fetch --save git+https://github.com/Jacobus-afk/linenoise-zig.git
```

You can then import linenoise in your `build.zig` with:

```zig
const linenoise = b.dependency("linenoise", .{
    .target = target,
    .optimize = optimize,
});

exe.linkLibrary(linenoise.artifact("linenoise"));
```
