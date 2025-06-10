///|
pub(all) enum Phase {
  Waiting
  Stretching
  Turning
  Walking
  Transitioning
  Falling
  GameOver
} derive(Eq)

///|
pub(all) struct Platform {
  x : Int
  width : Int
}

///|
pub(all) struct Stick {
  x : Int
  length : Int
  rotation : Int
}

///|
pub(all) struct Hero {
  x : Int
  y : Int
}

///|
pub const CANVAS_HEIGHT : Int = 375

///|
pub const CANVAS_WIDTH : Int = 375

///|
pub const PLATFORM_HEIGHT : Int = 100

///|
const HERO_WIDTH : Int = 20

///|
const HERO_HEIGHT : Int = 30
