extern type HTMLCanvasElement

#js.gen(function, global, "document", "querySelector")
pub fn HTMLCanvasElement::from_query(selector : String) -> HTMLCanvasElement? {
  __gen_ffi__apply_globalThis_document_querySelector__HTMLCanvasElement__from_query(
    selector |> @js.Value::cast_from,
  )
  |> @js.Value::cast
  |> @js.Optional::to_option
}

extern "js" fn __gen_ffi__apply_globalThis_document_querySelector__HTMLCanvasElement__from_query(
  __ : @js.Value
) -> @js.Value =
  #|(...args) => globalThis["document"]["querySelector"](...args)

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

#js.gen(property, prop, "onkeydown")
pub fn HTMLCanvasElement::set_on_key_down(
  canvas : Self,
  f : (KeyboardEvent) -> Unit
) -> Unit {
  __gen_ffi__set_prop_onkeydown__HTMLCanvasElement__set_on_key_down(
    canvas |> @js.Value::cast_from,
    f |> @js.Value::cast_from,
  )
}

extern "js" fn __gen_ffi__set_prop_onkeydown__HTMLCanvasElement__set_on_key_down(
  __ : @js.Value,
  __ : @js.Value
) =
  #|(self, arg) => { self["onkeydown"] = arg }

#js.gen(property, prop, "onkeyup")
pub fn HTMLCanvasElement::set_on_key_up(
  canvas : Self,
  f : (KeyboardEvent) -> Unit
) -> Unit {
  __gen_ffi__set_prop_onkeyup__HTMLCanvasElement__set_on_key_up(
    canvas |> @js.Value::cast_from,
    f |> @js.Value::cast_from,
  )
}

extern "js" fn __gen_ffi__set_prop_onkeyup__HTMLCanvasElement__set_on_key_up(
  __ : @js.Value,
  __ : @js.Value
) =
  #|(self, arg) => { self["onkeyup"] = arg }

pub let htmlCanvasElement : @js.Value = __gen_ffi_set_globalThis_HTMLCanvasElement__htmlCanvasElement()
  |> @js.Value::cast

extern "js" fn __gen_ffi_set_globalThis_HTMLCanvasElement__htmlCanvasElement() ->
     @js.Value =
  #|() => globalThis["HTMLCanvasElement"]

