///|
let stretching_speed : Double = 4

///|
let transitioning_speed : Double = 2

///|
let walking_speed : Double = 4

///|
let turning_speed : Double = 4

///|
let falling_speed : Double = 2

///|
let last : Ref[Double] = { val: 0 }

///|
let phase : Ref[@lib.Phase] = { val: Waiting }

///|
let hero : Ref[@lib.Hero] = { val: @lib.Hero::{ x: 0, y: 0 } }

///|
let sticks : Array[@lib.Stick] = []

///|
let platforms : Array[@lib.Platform] = []

///|
let scene_offset : Ref[Double] = { val: 0 }

///|
let random : @random.Rand = @random.Rand::new(
  generator=@lib.LCG::new(0x123456789ABCDEF0),
)

///|
fn hit_platform() -> @lib.Platform? {
  guard sticks is [.., last_stick] && last_stick.rotation == 90
  let stick_far_x = last_stick.x + last_stick.length
  platforms
  .search_by(fn(platform) {
    platform.x < stick_far_x && platform.x + platform.width > stick_far_x
  })
  .map(platforms[_])
}

///|
fn generate_platform() -> Unit {
  guard platforms is [.., last_platform]
  let furthest_x = last_platform.x + last_platform.width
  let mut current_furthest_x = furthest_x
  while furthest_x + @lib.CANVAS_WIDTH > current_furthest_x {
    let platform = @lib.next_platform(random, current_furthest_x)
    platforms.push(platform)
    current_furthest_x = platform.x + platform.width
  }
}

///|
fn main {
  guard @canvas_js.HTMLCanvasElement::from_query("#canvas") is Some(canvas) else {
    println("Canvas not found")
    panic()
  }
  guard canvas.get_context(context="2d") is Some(ctx) else {
    println("Canvas context not found")
    panic()
  }
  fn animate(time : Double) -> Unit {
    if last.val == 0 {
      last.val = time
      @canvas_js.request_animation_frame(animate) |> ignore
      return
    }
    let time_passed = time - last.val
    match phase.val {
      Transitioning => {
        scene_offset.val += time_passed / transitioning_speed
        guard hit_platform() is Some(platform)
        if platform.x + platform.width - scene_offset.val.to_int() < 100 {
          sticks.push({ x: platform.x + platform.width, length: 0, rotation: 0 })
          phase.val = Waiting
        }
      }
      Walking => {
        hero.val = {
          ..hero.val,
          x: hero.val.x + (time_passed / walking_speed).to_int(),
        }
        if hit_platform() is Some(platform) {
          // If the hero hits a platform, we can generate a new one
          let max_x = platform.x + platform.width - 30
          if hero.val.x > max_x {
            hero.val = { ..hero.val, x: max_x }
            phase.val = Transitioning
          }
        } else {
          let max_x = sticks.last().unwrap().x + sticks.last().unwrap().length
          if hero.val.x > max_x {
            hero.val = { ..hero.val, x: max_x }
            phase.val = Falling
          }
        }
      }
      Turning => {
        guard sticks.pop() is Some(stick)
        if stick.rotation >= 90 {
          // If the stick is fully turned, we can start walking
          sticks.push({ ..stick, rotation: 90 })
          if hit_platform() is Some(_) {
            generate_platform()
          }
          phase.val = Walking
        } else {
          sticks.push({
            ..stick,
            rotation: stick.rotation + (time_passed / turning_speed).to_int(),
          })
        }
      }
      Stretching => {
        guard sticks.pop() is Some(stick)
        sticks.push({
          ..stick,
          length: stick.length + (time_passed / stretching_speed).to_int(),
        })
      }
      Falling => {
        hero.val = {
          ..hero.val,
          y: hero.val.y + (time_passed / falling_speed).to_int(),
        }
        guard sticks.last() is Some(stick)
        if stick.rotation < 180 {
          sticks.unsafe_pop_back() |> ignore
          sticks.push({
            ..stick,
            rotation: stick.rotation + (time_passed / turning_speed).to_int(),
          })
        }
        let max_hero = @lib.PLATFORM_HEIGHT + 100
        if hero.val.y > max_hero {
          phase.val = GameOver
        }
      }
      Waiting | GameOver => ()
    }
    @lib.draw(ctx, scene_offset.val, hero.val, platforms, sticks)
    if phase.val is GameOver {
      ctx.fill_text(
        "GAME OVER",
        @lib.CANVAS_WIDTH.to_double() / 2,
        @lib.CANVAS_HEIGHT.to_double() / 2,
      )
      // draw once and stop the animation
      return
    } else if phase.val is Waiting {
      return
    }
    last.val = time
    @canvas_js.request_animation_frame(animate) |> ignore
  }

  fn restart_game() -> Unit {
    phase.val = Waiting
    // Reset hero position
    hero.val = @lib.Hero::{ x: 70, y: 0 }
    // Reset sticks
    sticks.clear()
    sticks.push({ x: 100, length: 0, rotation: 0 })
    // Reset platforms
    platforms.clear()
    platforms.push({ x: 50, width: 50 })
    generate_platform()
    // Reset scene offset
    scene_offset.val = 0
    // Reset last time
    last.val = 0
    @lib.draw(ctx, scene_offset.val, hero.val, platforms, sticks)
  }
  // event listeners
  canvas.set_on_mouse_down(fn(_) {
    if phase.val == Waiting {
      phase.val = Stretching
      last.val = 0
      @canvas_js.request_animation_frame(animate) |> ignore
    }
  })
  canvas.set_on_mouse_up(fn(_) {
    if phase.val == Stretching {
      phase.val = Turning
    } else if phase.val == GameOver {
      restart_game()
    }
  })
  restart_game()
}
