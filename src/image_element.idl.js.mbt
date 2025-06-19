#external
type HTMLImageElement

#js.gen(property, prop, "src")
pub fn HTMLImageElement::set_src(self : HTMLImageElement, src : String) -> Unit {
  __gen_ffi__set_prop_src__HTMLImageElement__set_src(
    self |> @js.Value::cast_from,
    src |> @js.Value::cast_from,
  )
}

extern "js" fn __gen_ffi__set_prop_src__HTMLImageElement__set_src(
  __ : @js.Value,
  __ : @js.Value
) =
  #|(self, arg) => { self["src"] = arg }

