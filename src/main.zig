const std = @import("std");
const rl = @import("raylib");

const utils = @import("utils.zig");
const cl = @import("colors.zig");
const c = @import("constants.zig");
const globals = @import("globals.zig");

const math = rl.math;

pub fn main() !void {
    try init();
    defer rl.closeWindow();

    var camera = rl.Camera2D{ .target = rl.Vector2{ .x = 0, .y = 0 }, .offset = rl.Vector2{ .x = 0, .y = 0 }, .rotation = 0, .zoom = 1 };
    var scrollY: f32 = 0.0;
    var velocityY: f32 = 0.0;

    while (!rl.windowShouldClose()) {
        utils.doDaThingWithScroll(&scrollY, &velocityY, &camera.target.y);

        rl.beginDrawing();
        rl.clearBackground(cl.BLACK);
            rl.beginMode2D(camera);
                rl.drawTextEx(globals.Context.sansSerifFont.?, "Begin bro", rl.Vector2{ .x = 20, .y = 20 }, 20, 2, cl.LIGHTGRAY);
                rl.drawRectangle(20, 100, 200, 200, cl.RED);
                rl.drawTextEx(globals.Context.serifFont.?, "End bro", rl.Vector2{ .x = 20, .y = 950 }, 200, 2, cl.SKYBLUE);
            rl.endMode2D();
        rl.endDrawing();
    }

}

fn init() !void {
    rl.setConfigFlags(.{ .window_resizable = true });
    
    rl.initWindow(1280, 620, "Same shit, different language");
    rl.maximizeWindow();
    rl.setTargetFPS(60);

    globals.Context.serifFont = try rl.loadFontEx("./src/assets/fonts/Fraunces.ttf", 200, null);
    globals.Context.sansSerifFont = try rl.loadFontEx("./src/assets/fonts/InstrumentSans.ttf", 200, null);

    rl.setTextureFilter(globals.Context.sansSerifFont.?.texture, .trilinear);
    rl.setTextureFilter(globals.Context.serifFont.?.texture, .trilinear);
}
