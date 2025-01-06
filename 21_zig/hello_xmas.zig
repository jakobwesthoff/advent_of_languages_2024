const std = @import("std");
const Allocator = std.mem.Allocator;

//    /\
//   /  \
//   /  \
//  /  o \
//  /    \
// / u    \
// --------
//    ||
//    ||

pub fn main() !void {
    var gpo = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpo.deinit();

    const allocator = gpo.allocator();

    try printTree(allocator, 7);
}

fn printTree(allocator: Allocator, groups: usize) !void {
    const stdout = std.io.getStdOut().writer();
    
    var aa = std.heap.ArenaAllocator.init(allocator);
    defer aa.deinit();
    const arena = aa.allocator();

    const lines = try makeTree(arena, groups);

    for (lines) |line| {
        try stdout.writeAll(line);
        try stdout.writeAll("\n");
    }
}

fn repeat(arena: Allocator, n: usize, c: u8) ![]u8 {
    const buffer = try arena.alloc(u8, n);
    @memset(buffer, c);
    return buffer;
}

fn makeTree(arena: Allocator, groups: usize) ![][]u8 {
    var lines = std.ArrayList([]u8).init(arena);
    defer lines.deinit();
    
    for (0..groups) |n| {
        try lines.appendSlice(
            try makeGroup(arena, n, groups)
        );
    }

    try lines.append(try repeat(arena, groups*2+2, '-'));
    
    try lines.appendSlice(
        try makeTrunk(arena, groups)
    );

    return lines.toOwnedSlice();
}

fn makeGroup(arena: Allocator, n: usize, groups: usize) ![][]u8 {
    var outside = try repeat(arena, groups-n, ' ');
    var inside = try repeat(arena, n*2, ' ');
    const line1 = try std.fmt.allocPrint(arena, "{s}/{s}\\", .{outside, inside});

    outside = try repeat(arena, groups-n-1, ' ');
    inside = try repeat(arena, (n+1)*2, ' ');
    const line2 = try std.fmt.allocPrint(arena, "{s}/{s}\\", .{outside, inside});

    return try arena.dupe([]u8, &.{line1, line2});
}

fn makeTrunk(arena: Allocator, groups: usize) ![][]u8 {
    const outside = try repeat(arena, groups, ' ');
    const line = try std.fmt.allocPrint(arena, "{s}||", .{outside});
    return try arena.dupe([]u8, &.{line, line});
}


