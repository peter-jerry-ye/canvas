/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/KeyboardEvent/key
pub fn key(self : KeyboardEvent) -> String {
  key_ffi(self).to_string().unwrap()
}

fn key_ffi(self : KeyboardEvent) -> @lib.JS_String = "KeyboardEvent" "key"

/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/KeyboardEvent/code
pub fn code(self : KeyboardEvent) -> String {
  code_ffi(self).to_string().unwrap()
}

fn code_ffi(self : KeyboardEvent) -> @lib.JS_String = "KeyboardEvent" "code"

/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/KeyboardEvent/isComposing
pub fn is_composing(self : KeyboardEvent) -> Bool = "KeyboardEvent" "isComposing"
