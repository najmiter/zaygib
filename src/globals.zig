const rl = @import("raylib");

pub const GlobalContext = struct {
    serifFont: ?rl.Font = null,
    sansSerifFont: ?rl.Font = null,
};

pub var Context: GlobalContext = .{};
