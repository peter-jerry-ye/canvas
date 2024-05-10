let last : Ref[Option[(Double, Double)]] = { val: None }

pub fn entry(canvas : @canvas.Canvas2D) -> Unit {
  @canvas.set_on_mouse_move(
    fn(event) {
      if event.buttons().land(1) == 1 {
        let offset_x = event.offset_x()
        let offset_y = event.offset_y()
        match last.val {
          Some((x, y)) => {
            canvas.set_stroke_style(Color("black"))
            canvas.begin_path()
            canvas.move_to(x, y)
            canvas.line_to(offset_x, offset_y)
            canvas.stroke()
            last.val = Some((offset_x, offset_y))
          }
          None => last.val = Some((offset_x, offset_y))
        }
      } else {
        last.val = None
      }
    },
  )
}
