const std = @import("std");
const rl = @import("raylib");

const utils = @import("utils.zig");
const cl = @import("colors.zig");
const c = @import("constants.zig");

const math = rl.math;

pub fn main() !void {
    rl.initWindow(1280, 620, "Ayyyy");
    rl.setTargetFPS(60);

    var camera = rl.Camera2D{ .target = rl.Vector2{ .x = 0, .y = 0 }, .offset = rl.Vector2{ .x = 0, .y = 0 }, .rotation = 0, .zoom = 1 };
    var scrollY: f32 = 0.0;
    var velocityY: f32 = 0.0;

    while (!rl.windowShouldClose()) {
        utils.doDaThingWithScroll(&scrollY, &velocityY, &camera.target.y);

        rl.beginDrawing();
        rl.clearBackground(cl.BLACK);
        {
            rl.beginMode2D(camera);
            {
                rl.drawText("Begin bro", 20, 20, 20, cl.LIGHTGRAY);
                rl.drawRectangle(20, 100, 200, 200, cl.RED);
                rl.drawText("End bro", 20, 950, 200, cl.SKYBLUE);
            } // draw calls
            rl.endMode2D();
        } // end 2d mode
        rl.endDrawing();
    }

    rl.closeWindow();
}
