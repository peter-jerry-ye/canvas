extern type CustomElementRegistry

#js.gen(function, prop, "define")
#js.gen(param, "options", optional)
pub fn define(
  self : CustomElementRegistry,
  name : String,
  constructor : @js.Value,
  options? : CustomElementDefinitionOption
) -> Unit {
  __gen_ffi__apply_prop_define__CustomElementRegistry__define(
    self |> @js.Value::cast_from,
    name |> @js.Value::cast_from,
    constructor |> @js.Value::cast_from,
    options |> @js.Optional::from_option |> @js.Value::cast_from,
  )
}

extern "js" fn __gen_ffi__apply_prop_define__CustomElementRegistry__define(
  __ : @js.Value,
  __ : @js.Value,
  __ : @js.Value,
  __ : @js.Value
) =
  #|(self, ...args) => self["define"](...args)

pub let custom_elements : CustomElementRegistry = __gen_ffi_set_globalThis_customElements__custom_elements()
  |> @js.Value::cast

extern "js" fn __gen_ffi_set_globalThis_customElements__custom_elements() ->
     @js.Value =
  #|() => globalThis["customElements"]

extern type CustomElementDefinitionOption

#js.gen(constructor, global, "Object")
pub fn CustomElementDefinitionOption::make() -> CustomElementDefinitionOption {
  __gen_ffi__new_globalThis_Object__CustomElementDefinitionOption__make()
  |> @js.Value::cast
}

extern "js" fn __gen_ffi__new_globalThis_Object__CustomElementDefinitionOption__make() ->
     @js.Value =
  #|(...args) => new globalThis["Object"](...args)

#js.gen(property, prop, "extends")
pub fn CustomElementDefinitionOption::set_extends(
  option : Self,
  extends : String
) -> Unit {
  __gen_ffi__set_prop_extends__CustomElementDefinitionOption__set_extends(
    option |> @js.Value::cast_from,
    extends |> @js.Value::cast_from,
  )
}

extern "js" fn __gen_ffi__set_prop_extends__CustomElementDefinitionOption__set_extends(
  __ : @js.Value,
  __ : @js.Value
) =
  #|(self, arg) => { self["extends"] = arg }

