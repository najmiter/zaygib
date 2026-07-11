const std = @import("std");
const rl = @import("raylib");
const cl = @import("colors.zig");

const math = rl.math;

pub fn main() !void {
    rl.initWindow(1280, 620, "Ayyyy");
    rl.setTargetFPS(60);

    var camera = rl.Camera2D{ .target = rl.Vector2{ .x = 0, .y = 0 }, .offset = rl.Vector2{ .x = 0, .y = 0 }, .rotation = 0, .zoom = 1 };

    while (!rl.windowShouldClose()) {
        const wheel = rl.getMouseWheelMove();

        camera.target.y -= wheel * 10;
        camera.target.y = math.clamp(camera.target.y, 0, 900);

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
