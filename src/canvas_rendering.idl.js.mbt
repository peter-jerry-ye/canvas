extern type CanvasRendering2D

#js.gen(property, prop, "strokeStyle")
pub fn CanvasRendering2D::set_stroke_style(
  canvas : Self,
  color : String
) -> Unit {
  __gen_ffi__set_prop_strokeStyle__CanvasRendering2D__set_stroke_style(
    canvas |> @js.Value::cast_from,
    color |> @js.Value::cast_from,
  )
}

extern "js" fn __gen_ffi__set_prop_strokeStyle__CanvasRendering2D__set_stroke_style(
  __ : @js.Value,
  __ : @js.Value
) =
  #|(self, arg) => { self["strokeStyle"] = arg }

#js.gen(function, prop, "beginPath")
pub fn CanvasRendering2D::begin_path(canvas : Self) -> Unit {
  __gen_ffi__apply_prop_beginPath__CanvasRendering2D__begin_path(
    canvas |> @js.Value::cast_from,
  )
}

extern "js" fn __gen_ffi__apply_prop_beginPath__CanvasRendering2D__begin_path(
  __ : @js.Value
) =
  #|(self, ...args) => self["beginPath"](...args)

#js.gen(function, prop, "moveTo")
pub fn CanvasRendering2D::move_to(
  canvas : Self,
  x : Double,
  y : Double
) -> Unit {
  __gen_ffi__apply_prop_moveTo__CanvasRendering2D__move_to(
    canvas |> @js.Value::cast_from,
    x |> @js.Value::cast_from,
    y |> @js.Value::cast_from,
  )
}

extern "js" fn __gen_ffi__apply_prop_moveTo__CanvasRendering2D__move_to(
  __ : @js.Value,
  __ : @js.Value,
  __ : @js.Value
) =
  #|(self, ...args) => self["moveTo"](...args)

#js.gen(function, prop, "lineTo")
pub fn CanvasRendering2D::line_to(
  canvas : Self,
  x : Double,
  y : Double
) -> Unit {
  __gen_ffi__apply_prop_lineTo__CanvasRendering2D__line_to(
    canvas |> @js.Value::cast_from,
    x |> @js.Value::cast_from,
    y |> @js.Value::cast_from,
  )
}

extern "js" fn __gen_ffi__apply_prop_lineTo__CanvasRendering2D__line_to(
  __ : @js.Value,
  __ : @js.Value,
  __ : @js.Value
) =
  #|(self, ...args) => self["lineTo"](...args)

#js.gen(function, prop, "stroke")
pub fn CanvasRendering2D::stroke(canvas : Self) -> Unit {
  __gen_ffi__apply_prop_stroke__CanvasRendering2D__stroke(
    canvas |> @js.Value::cast_from,
  )
}

extern "js" fn __gen_ffi__apply_prop_stroke__CanvasRendering2D__stroke(
  __ : @js.Value
) =
  #|(self, ...args) => self["stroke"](...args)

