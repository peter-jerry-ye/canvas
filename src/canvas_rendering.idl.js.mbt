extern type CanvasRendering2D

extern type CanvasPattern

extern type CanvasGradient

pub(all) enum CanvasFillStrokeStyles {
  CSS(String)
  Pattern(CanvasPattern)
  Gradient(CanvasGradient)
}

pub impl @js.Cast for CanvasFillStrokeStyles with from(
  value : CanvasFillStrokeStyles
) {
  match value {
    CSS(p) => p |> @js.Value::cast_from
    Pattern(p) => p |> @js.Value::cast_from
    Gradient(p) => p |> @js.Value::cast_from
  }
}

pub impl @js.Cast for CanvasFillStrokeStyles with into(_) {
  None
}

#js.gen(property, prop, "fillStyle")
#js.gen(param, "style", unwrap)
pub fn CanvasRendering2D::set_fill_style(
  canvas : Self,
  style : CanvasFillStrokeStyles
) -> Unit {
  __gen_ffi__set_prop_fillStyle__CanvasRendering2D__set_fill_style(
    canvas |> @js.Value::cast_from,
    style |> @js.Cast::from |> @js.Value::cast_from,
  )
}

extern "js" fn __gen_ffi__set_prop_fillStyle__CanvasRendering2D__set_fill_style(
  __ : @js.Value,
  __ : @js.Value
) =
  #|(self, arg) => { self["fillStyle"] = arg }

#js.gen(property, prop, "strokeStyle")
#js.gen(param, "style", unwrap)
pub fn CanvasRendering2D::set_stroke_style(
  canvas : Self,
  style : CanvasFillStrokeStyles
) -> Unit {
  __gen_ffi__set_prop_strokeStyle__CanvasRendering2D__set_stroke_style(
    canvas |> @js.Value::cast_from,
    style |> @js.Cast::from |> @js.Value::cast_from,
  )
}

extern "js" fn __gen_ffi__set_prop_strokeStyle__CanvasRendering2D__set_stroke_style(
  __ : @js.Value,
  __ : @js.Value
) =
  #|(self, arg) => { self["strokeStyle"] = arg }

#js.gen(property, prop, "lineWidth")
pub fn CanvasRendering2D::set_line_width(canvas : Self, width : Double) -> Unit {
  __gen_ffi__set_prop_lineWidth__CanvasRendering2D__set_line_width(
    canvas |> @js.Value::cast_from,
    width |> @js.Value::cast_from,
  )
}

extern "js" fn __gen_ffi__set_prop_lineWidth__CanvasRendering2D__set_line_width(
  __ : @js.Value,
  __ : @js.Value
) =
  #|(self, arg) => { self["lineWidth"] = arg }

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

#js.gen(function, prop, "fillRect")
pub fn CanvasRendering2D::fill_rect(
  canvas : Self,
  x : Double,
  y : Double,
  width : Double,
  height : Double
) -> Unit {
  __gen_ffi__apply_prop_fillRect__CanvasRendering2D__fill_rect(
    canvas |> @js.Value::cast_from,
    x |> @js.Value::cast_from,
    y |> @js.Value::cast_from,
    width |> @js.Value::cast_from,
    height |> @js.Value::cast_from,
  )
}

extern "js" fn __gen_ffi__apply_prop_fillRect__CanvasRendering2D__fill_rect(
  __ : @js.Value,
  __ : @js.Value,
  __ : @js.Value,
  __ : @js.Value,
  __ : @js.Value
) =
  #|(self, ...args) => self["fillRect"](...args)

#js.gen(function, prop, "fillText")
pub fn CanvasRendering2D::fill_text(
  canvas : Self,
  text : String,
  x : Double,
  y : Double,
  max_width? : Double
) -> Unit {
  __gen_ffi__apply_prop_fillText__CanvasRendering2D__fill_text(
    canvas |> @js.Value::cast_from,
    text |> @js.Value::cast_from,
    x |> @js.Value::cast_from,
    y |> @js.Value::cast_from,
    max_width |> @js.Optional::from_option |> @js.Value::cast_from,
  )
}

extern "js" fn __gen_ffi__apply_prop_fillText__CanvasRendering2D__fill_text(
  __ : @js.Value,
  __ : @js.Value,
  __ : @js.Value,
  __ : @js.Value,
  __ : @js.Value
) =
  #|(self, ...args) => self["fillText"](...args)

#js.gen(function, prop, "clearRect")
pub fn CanvasRendering2D::clear_rect(
  canvas : Self,
  x : Double,
  y : Double,
  width : Double,
  height : Double
) -> Unit {
  __gen_ffi__apply_prop_clearRect__CanvasRendering2D__clear_rect(
    canvas |> @js.Value::cast_from,
    x |> @js.Value::cast_from,
    y |> @js.Value::cast_from,
    width |> @js.Value::cast_from,
    height |> @js.Value::cast_from,
  )
}

extern "js" fn __gen_ffi__apply_prop_clearRect__CanvasRendering2D__clear_rect(
  __ : @js.Value,
  __ : @js.Value,
  __ : @js.Value,
  __ : @js.Value,
  __ : @js.Value
) =
  #|(self, ...args) => self["clearRect"](...args)

#js.gen(property, prop, "font")
pub fn CanvasRendering2D::set_font(canvas : Self, font : String) -> Unit {
  __gen_ffi__set_prop_font__CanvasRendering2D__set_font(
    canvas |> @js.Value::cast_from,
    font |> @js.Value::cast_from,
  )
}

extern "js" fn __gen_ffi__set_prop_font__CanvasRendering2D__set_font(
  __ : @js.Value,
  __ : @js.Value
) =
  #|(self, arg) => { self["font"] = arg }

#js.gen(function, prop, "save")
pub fn CanvasRendering2D::save(canvas : Self) -> Unit {
  __gen_ffi__apply_prop_save__CanvasRendering2D__save(
    canvas |> @js.Value::cast_from,
  )
}

extern "js" fn __gen_ffi__apply_prop_save__CanvasRendering2D__save(
  __ : @js.Value
) =
  #|(self, ...args) => self["save"](...args)

#js.gen(function, prop, "restore")
pub fn CanvasRendering2D::restore(canvas : Self) -> Unit {
  __gen_ffi__apply_prop_restore__CanvasRendering2D__restore(
    canvas |> @js.Value::cast_from,
  )
}

extern "js" fn __gen_ffi__apply_prop_restore__CanvasRendering2D__restore(
  __ : @js.Value
) =
  #|(self, ...args) => self["restore"](...args)

#js.gen(function, prop, "translate")
pub fn CanvasRendering2D::translate(
  canvas : Self,
  x : Double,
  y : Double
) -> Unit {
  __gen_ffi__apply_prop_translate__CanvasRendering2D__translate(
    canvas |> @js.Value::cast_from,
    x |> @js.Value::cast_from,
    y |> @js.Value::cast_from,
  )
}

extern "js" fn __gen_ffi__apply_prop_translate__CanvasRendering2D__translate(
  __ : @js.Value,
  __ : @js.Value,
  __ : @js.Value
) =
  #|(self, ...args) => self["translate"](...args)

#js.gen(function, prop, "rotate")
pub fn CanvasRendering2D::rotate(canvas : Self, angle : Double) -> Unit {
  __gen_ffi__apply_prop_rotate__CanvasRendering2D__rotate(
    canvas |> @js.Value::cast_from,
    angle |> @js.Value::cast_from,
  )
}

extern "js" fn __gen_ffi__apply_prop_rotate__CanvasRendering2D__rotate(
  __ : @js.Value,
  __ : @js.Value
) =
  #|(self, ...args) => self["rotate"](...args)

