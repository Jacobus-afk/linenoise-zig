const std = @import("std");

pub fn build(b: *std.Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const mod = b.createModule(.{
        .target = target,
        .optimize = optimize,
        .link_libc = true,
    });

    const lib = b.addLibrary(.{
        .name = "linenoise",
        .linkage = .static,
        .root_module = mod,
    });

    const linenoise = b.dependency("linenoise", .{
        .target = target,
        .optimize = optimize,
    });

    mod.addCSourceFiles(.{
        .root = linenoise.path(""),
        .files = &.{"linenoise.c"},
    });

    mod.addIncludePath(linenoise.path(""));

    lib.installHeadersDirectory(linenoise.path(""), "", .{
        .include_extensions = &.{"linenoise.h"},
    });

    b.installArtifact(lib);
}
