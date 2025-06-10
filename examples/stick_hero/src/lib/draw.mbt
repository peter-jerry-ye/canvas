///|
fn draw_hero(canvas : @canvas_js.CanvasRendering2D, hero : Hero) -> Unit {
  canvas.set_fill_style(CSS("red"))
  canvas.fill_rect(
    hero.x.to_double(),
    (hero.y + CANVAS_HEIGHT - PLATFORM_HEIGHT - HERO_HEIGHT).to_double(),
    HERO_WIDTH.to_double(),
    HERO_HEIGHT.to_double(),
  )
}

///|
fn draw_platforms(
  canvas : @canvas_js.CanvasRendering2D,
  platforms : Array[Platform]
) -> Unit {
  for platform in platforms {
    canvas.set_fill_style(CSS("black"))
    canvas.fill_rect(
      platform.x.to_double(),
      (CANVAS_HEIGHT - PLATFORM_HEIGHT).to_double(),
      platform.width.to_double(),
      PLATFORM_HEIGHT.to_double(),
    )
  }
}

///|
fn draw_sticks(
  canvas : @canvas_js.CanvasRendering2D,
  sticks : Array[Stick]
) -> Unit {
  for stick in sticks {
    canvas.save()

    // Move the anchor point to the start of the stick and rotate
    canvas.translate(
      stick.x.to_double(),
      (CANVAS_HEIGHT - PLATFORM_HEIGHT).to_double(),
    )
    canvas.rotate(@math.PI / 180 * stick.rotation.to_double())

    // Draw the stick
    canvas.set_line_width(2.0)
    canvas.begin_path()
    canvas.move_to(0, 0)
    canvas.line_to(0, -stick.length.to_double())
    canvas.stroke()

    // Restore transformation
    canvas.restore()
  }
}

///|
pub fn draw(
  canvas : @canvas_js.CanvasRendering2D,
  scene_offset : Double,
  hero : Hero,
  platforms : Array[Platform],
  stick : Array[Stick]
) -> Unit {
  canvas.clear_rect(0, 0, CANVAS_WIDTH.to_double(), CANVAS_HEIGHT.to_double())
  // save the current transformation
  canvas.save()

  // shifting the view
  canvas.translate(-scene_offset, 0)

  // draw scene
  draw_hero(canvas, hero)
  draw_platforms(canvas, platforms)
  draw_sticks(canvas, stick)

  // restore transformation to the last save
  canvas.restore()
}
