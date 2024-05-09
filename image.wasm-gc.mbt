fn HTMLImageElement::make_ffi() -> HTMLImageElement = "peter-jerry-ye:canvas/HTMLImageElement" "new"

fn HTMLImageElement::make_width_ffi(width : Int) -> HTMLImageElement = "peter-jerry-ye:canvas/HTMLImageElement" "new"

fn HTMLImageElement::make_width_height_ffi(
  width : Int,
  height : Int
) -> HTMLImageElement = "peter-jerry-ye:canvas/HTMLImageElement" "new"

/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/HTMLImageElement/Image
pub fn HTMLImageElement::make(
  ~width : Option[Int] = None,
  ~height : Option[Int] = None
) -> HTMLImageElement {
  match width {
    None => make_ffi()
    Some(w) =>
      match height {
        None => make_width_ffi(w)
        Some(h) => make_width_height_ffi(w, h)
      }
  }
}

fn set_src_ffi(image : HTMLImageElement, src : @lib.JS_String) -> Unit = "peter-jerry-ye:canvas/HTMLImageElement" "set_src"

/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/HTMLImageElement/src
pub fn HTMLImageElement::set_src(
  image : HTMLImageElement,
  src : String
) -> Unit {
  set_src_ffi(image, @lib.JS_String::from_string(src).unwrap())
}
