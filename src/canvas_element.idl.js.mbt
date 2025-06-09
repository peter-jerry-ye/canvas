extern type HTMLCanvasElement

#js.gen(function, prop, "getContext")
#js.gen(param, "context", optional)
pub fn HTMLCanvasElement::get_context(
  canvas : Self,
  context~ : String = "2d"
) -> CanvasRendering2D? {
  __gen_ffi__apply_prop_getContext__HTMLCanvasElement__get_context(
    canvas |> @js.Value::cast_from,
    context |> @js.Value::cast_from,
  )
  |> @js.Value::cast
  |> @js.Optional::to_option
}

extern "js" fn __gen_ffi__apply_prop_getContext__HTMLCanvasElement__get_context(
  __ : @js.Value,
  __ : @js.Value
) -> @js.Value =
  #|(self, ...args) => self["getContext"](...args)

#js.gen(property, prop, "onmousemove")
pub fn HTMLCanvasElement::set_on_mouse_move(
  canvas : Self,
  f : (MouseEvent) -> Unit
) -> Unit {
  __gen_ffi__set_prop_onmousemove__HTMLCanvasElement__set_on_mouse_move(
    canvas |> @js.Value::cast_from,
    f |> @js.Value::cast_from,
  )
}

extern "js" fn __gen_ffi__set_prop_onmousemove__HTMLCanvasElement__set_on_mouse_move(
  __ : @js.Value,
  __ : @js.Value
) =
  #|(self, arg) => { self["onmousemove"] = arg }

