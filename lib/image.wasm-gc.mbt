//  Copyright 2024 International Digital Economy Academy
// 
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
// 
//  http://www.apache.org/licenses/LICENSE-2.0
// 
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.

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
