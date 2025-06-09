extern type MouseEvent

#js.gen(property, prop, "buttons")
pub fn MouseEvent::buttons(event : Self) -> Int {
  __gen_ffi__get_prop_buttons__MouseEvent__buttons(
    event |> @js.Value::cast_from,
  )
  |> @js.Value::cast
}

extern "js" fn __gen_ffi__get_prop_buttons__MouseEvent__buttons(
  __ : @js.Value
) -> @js.Value =
  #|(self) => self["buttons"]

#js.gen(property, prop, "offsetX")
pub fn MouseEvent::offset_x(event : Self) -> Double {
  __gen_ffi__get_prop_offsetX__MouseEvent__offset_x(
    event |> @js.Value::cast_from,
  )
  |> @js.Value::cast
}

extern "js" fn __gen_ffi__get_prop_offsetX__MouseEvent__offset_x(
  __ : @js.Value
) -> @js.Value =
  #|(self) => self["offsetX"]

#js.gen(property, prop, "offsetY")
pub fn MouseEvent::offset_y(event : Self) -> Double {
  __gen_ffi__get_prop_offsetY__MouseEvent__offset_y(
    event |> @js.Value::cast_from,
  )
  |> @js.Value::cast
}

extern "js" fn __gen_ffi__get_prop_offsetY__MouseEvent__offset_y(
  __ : @js.Value
) -> @js.Value =
  #|(self) => self["offsetY"]

