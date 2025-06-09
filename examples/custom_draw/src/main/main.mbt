///|
fn custom_canvas(this : @canvas_js.HTMLCanvasElement) -> Unit {
  let last : Ref[(Double, Double)?] = { val: None }
  let canvas = this.get_context(context="2d").unwrap()
  this.set_on_mouse_move(fn(event) {
    if (event.buttons() & 1) == 1 {
      let offset_x = event.offset_x()
      let offset_y = event.offset_y()
      match last.val {
        Some((x, y)) => {
          canvas.set_stroke_style("black")
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
  })
}

///|
let constructor : @js.Value = (custom_canvas |> @js.Value::cast_from).extends(
  @canvas_js.htmlCanvasElement,
)

///|
fn main {
  let options = @canvas_js.CustomElementDefinitionOption::make()
  options.set_extends("canvas")
  @canvas_js.custom_elements.define("custom-canvas", constructor, options~)
}
