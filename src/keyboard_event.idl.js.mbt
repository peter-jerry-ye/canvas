#external
type KeyboardEvent

#js.gen(property, prop, "key")
pub fn KeyboardEvent::key(event : Self) -> String {
  __gen_ffi__get_prop_key__KeyboardEvent__key(event |> @js.Value::cast_from)
  |> @js.Value::cast
}

extern "js" fn __gen_ffi__get_prop_key__KeyboardEvent__key(
  __ : @js.Value
) -> @js.Value =
  #|(self) => self["key"]

#js.gen(property, prop, "code")
pub fn KeyboardEvent::code(event : Self) -> String {
  __gen_ffi__get_prop_code__KeyboardEvent__code(event |> @js.Value::cast_from)
  |> @js.Value::cast
}

extern "js" fn __gen_ffi__get_prop_code__KeyboardEvent__code(
  __ : @js.Value
) -> @js.Value =
  #|(self) => self["code"]

