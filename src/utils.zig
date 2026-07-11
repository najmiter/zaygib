const rl = @import("raylib");
const c = @import("constants.zig");

const math = rl.math;

/// applies lerp on the scroll so it looks like a spring thing
///
/// updates `scrollY`, `velocityY`, and `cameraTargetY` (i.e., `camera.target.y`) internally
pub fn doDaThingWithScroll(scrollY: *f32, velocityY: *f32, cameraTargetY: *f32) void {
    const wheel = rl.getMouseWheelMove();

    scrollY.* -= wheel * c.SCROLL_SPEED;
    scrollY.* = math.clamp(scrollY.*, 0, 900);

    const distance = cameraTargetY.* - scrollY.*;
    const springForce = -c.STIFFNESS * distance; // somewhere in here is hooke's law: (F = -kx) they never told us it was this beautiful 🥹
    const stopingForce = -c.FRICTION * velocityY.*;

    velocityY.* += springForce + stopingForce;

    cameraTargetY.* += velocityY.*;
    cameraTargetY.* = math.lerp(cameraTargetY.*, scrollY.*, c.SCROLL_LERP);
}
