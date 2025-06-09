#js.gen(function, global, "window", "requestAnimationFrame")
pub fn request_animation_frame(callback : (Double) -> Unit) -> Double {
  __gen_ffi__apply_globalThis_window_requestAnimationFrame__request_animation_frame(
    callback |> @js.Value::cast_from,
  )
  |> @js.Value::cast
}

extern "js" fn __gen_ffi__apply_globalThis_window_requestAnimationFrame__request_animation_frame(
  __ : @js.Value
) -> @js.Value =
  #|(...args) => globalThis["window"]["requestAnimationFrame"](...args)

#js.gen(function, global, "window", "cancelAnimationFrame")
pub fn cancel_animation_frame(handle : Double) -> Unit {
  __gen_ffi__apply_globalThis_window_cancelAnimationFrame__cancel_animation_frame(
    handle |> @js.Value::cast_from,
  )
}

extern "js" fn __gen_ffi__apply_globalThis_window_cancelAnimationFrame__cancel_animation_frame(
  __ : @js.Value
) =
  #|(...args) => globalThis["window"]["cancelAnimationFrame"](...args)

