///|
let last : Ref[Int64] = { val: 0L }

///|
let cumul : Ref[Int64] = { val: 0L }

///|
let pause : Ref[Bool] = { val: false }

///|
fn main {
  let canvas = @canvas_js.HTMLCanvasElement::from_query("#canvas").unwrap()
  canvas.set_on_key_down(fn(event) {
    match event.code() {
      "Space" => pause.val = not(pause.val)
      "Enter" => {
        pause.val = false
        last.val = 0L
        cumul.val = 0L
      }
      _ => ()
    }
  })
  let canvas = canvas.get_context(context="2d").unwrap()
  fn update(time : Double) {
    let time = time.to_int64()
    if not(pause.val) {
      if last.val > 0L {
        cumul.val += time - last.val
        canvas.set_font("20px Arial")
        canvas.clear_rect(0.0, 0.0, 500.0, 500.0)
        canvas.fill_text(
          ((cumul.val / 100L).to_double() / 10.0 |> Double::to_string()) + "s",
          100.0,
          100.0,
        )
      }
    }
    last.val = time
    @canvas_js.request_animation_frame(update) |> ignore
  }

  @canvas_js.request_animation_frame(update) |> ignore
}
