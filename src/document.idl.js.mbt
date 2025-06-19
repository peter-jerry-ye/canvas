#external
type Document

pub let document : Document = __gen_ffi_set_globalThis_document__document()
  |> @js.Value::cast

extern "js" fn __gen_ffi_set_globalThis_document__document() -> @js.Value =
  #|() => globalThis["document"]

#js.gen(function, prop, "querySelector")
pub fn Document::query_selector(self : Self, selector : String) -> @js.Value? {
  __gen_ffi__apply_prop_querySelector__Document__query_selector(
    self |> @js.Value::cast_from,
    selector |> @js.Value::cast_from,
  )
  |> @js.Value::cast
  |> @js.Optional::to_option
}

extern "js" fn __gen_ffi__apply_prop_querySelector__Document__query_selector(
  __ : @js.Value,
  __ : @js.Value
) -> @js.Value =
  #|(self, ...args) => self["querySelector"](...args)

#js.gen(function, prop, "createElement")
pub fn Document::create_element(self : Self, tag_name : String) -> @js.Value {
  __gen_ffi__apply_prop_createElement__Document__create_element(
    self |> @js.Value::cast_from,
    tag_name |> @js.Value::cast_from,
  )
  |> @js.Value::cast
}

extern "js" fn __gen_ffi__apply_prop_createElement__Document__create_element(
  __ : @js.Value,
  __ : @js.Value
) -> @js.Value =
  #|(self, ...args) => self["createElement"](...args)

pub fn Document::create_image_element(self : Self) -> HTMLImageElement {
  self.create_element("img") |> @js.Value::cast
}

