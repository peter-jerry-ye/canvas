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

/// CanvasRenderingContext2D
/// 
/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D
type Canvas2D

/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/strokeRect
pub fn stroke_rect(
  self : Canvas2D,
  x : Double,
  y : Double,
  width : Double,
  height : Double
) = "canvas" "strokeRect"

/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/fillRect
pub fn fill_rect(
  self : Canvas2D,
  x : Double,
  y : Double,
  width : Double,
  height : Double
) = "canvas" "fillRect"

/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/clearRect
pub fn clear_rect(
  self : Canvas2D,
  x : Double,
  y : Double,
  width : Double,
  height : Double
) = "canvas" "clearRect"

/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/beginPath
pub fn begin_path(self : Canvas2D) = "canvas" "beginPath"

/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/closePath
pub fn close_path(self : Canvas2D) = "canvas" "closePath"

/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/moveTo
pub fn move_to(self : Canvas2D, x : Double, y : Double) = "canvas" "moveTo"

/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/lineTo
pub fn line_to(self : Canvas2D, x : Double, y : Double) = "canvas" "lineTo"

fn stroke_ffi(self : Canvas2D) = "canvas" "stroke"

fn stroke_path_ffi(self : Canvas2D, path : Path2D) = "canvas" "stroke"

/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/stroke
pub fn stroke(self : Canvas2D, ~path : Option[Path2D] = None) -> Unit {
  match path {
    None => self.stroke_ffi()
    Some(path) => self.stroke_path_ffi(path)
  }
}

fn fill_ffi(self : Canvas2D) = "canvas" "fill"

fn fill_fillRule_ffi(self : Canvas2D, fillRule : @lib.JS_String) = "canvas" "fill"

fn fill_path_ffi(self : Canvas2D, path : Path2D) = "canvas" "fill_path"

fn fill_path_fillRule_ffi(
  self : Canvas2D,
  path : Path2D,
  fillRule : @lib.JS_String
) = "canvas" "fill_path"

/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/fill
pub fn fill(
  self : Canvas2D,
  ~path : Option[Path2D] = None,
  ~fillRule : Option[FillRule] = None
) -> Unit {
  match (path, fillRule) {
    (None, None) => self.fill_ffi()
    (Some(path), None) => self.fill_path_ffi(path)
    (None, Some(fillRule)) =>
      self.fill_fillRule_ffi(
        @lib.JS_String::from_string(fillRule.to_string()).unwrap(),
      )
    (Some(path), Some(fillRule)) =>
      self.fill_path_fillRule_ffi(
        path,
        @lib.JS_String::from_string(fillRule.to_string()).unwrap(),
      )
  }
}

fn fill_text_ffi(
  self : Canvas2D,
  text : @lib.JS_String,
  x : Double,
  y : Double
) = "canvas" "fillText"

fn fill_text_maxwidth_ffi(
  self : Canvas2D,
  text : @lib.JS_String,
  x : Double,
  y : Double,
  max_width : Double
) = "canvas" "fillText"

/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/fillText
pub fn fill_text(
  self : Canvas2D,
  text : String,
  x : Double,
  y : Double,
  ~max_width : Option[Double] = None
) -> Unit {
  match max_width {
    None => self.fill_text_ffi(@lib.JS_String::from_string(text).unwrap(), x, y)
    Some(max_width) =>
      self.fill_text_maxwidth_ffi(
        @lib.JS_String::from_string(text).unwrap(),
        x,
        y,
        max_width,
      )
  }
}

fn stroke_text_ffi(
  self : Canvas2D,
  text : @lib.JS_String,
  x : Double,
  y : Double
) = "canvas" "strokeText"

fn stroke_text_maxwidth_ffi(
  self : Canvas2D,
  text : @lib.JS_String,
  x : Double,
  y : Double,
  max_width : Double
) = "canvas" "strokeText"

/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/strokeText
pub fn stroke_text(
  self : Canvas2D,
  text : String,
  x : Double,
  y : Double,
  ~max_width : Option[Double] = None
) -> Unit {
  match max_width {
    None =>
      self.stroke_text_ffi(@lib.JS_String::from_string(text).unwrap(), x, y)
    Some(max_width) =>
      self.stroke_text_maxwidth_ffi(
        @lib.JS_String::from_string(text).unwrap(),
        x,
        y,
        max_width,
      )
  }
}

/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/lineWidth
pub fn get_line_width(self : Canvas2D) -> Double = "canvas" "get_lineWidth"

/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/lineWidth
pub fn set_line_width(self : Canvas2D, width : Double) = "canvas" "set_lineWidth"

fn get_line_cap_ffi(self : Canvas2D) -> @lib.JS_String = "canvas" "get_lineCap"

/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/lineCap
pub fn get_line_cap(self : Canvas2D) -> LineCap {
  match @lib.JS_String::to_string(self.get_line_cap_ffi()).unwrap() {
    "butt" => LineCap::Butt
    "round" => LineCap::Round
    "square" => LineCap::Square
    _ => abort("Invalid line cap value.")
  }
}

fn set_line_cap_ffi(self : Canvas2D, cap : @lib.JS_String) = "canvas" "set_lineCap"

/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/lineCap
pub fn set_line_cap(self : Canvas2D, cap : LineCap) -> Unit {
  self.set_line_cap_ffi(@lib.JS_String::from_string(cap.to_string()).unwrap())
}

fn get_line_join_ffi(self : Canvas2D) -> @lib.JS_String = "canvas" "get_lineJoin"

/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/lineJoin
/// 
/// `join` is one of : "round" "bevel" "miter
pub fn get_line_join(self : Canvas2D) -> LineJoin {
  match get_line_join_ffi(self).to_string().unwrap() {
    "round" => LineJoin::Round
    "bevel" => LineJoin::Bevel
    "miter" => LineJoin::Miter
    _ => abort("Invalid line join value.")
  }
}

fn set_line_join_ffi(self : Canvas2D, join : @lib.JS_String) = "canvas" "set_lineJoin"

/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/lineJoin
/// 
/// `join` is one of : "round" "bevel" "miter"
pub fn set_line_join(self : Canvas2D, join : LineJoin) -> Unit {
  self.set_line_join_ffi(@lib.JS_String::from_string(join.to_string()).unwrap())
}

/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/miterLimit
pub fn get_miter_limit(self : Canvas2D) -> Double = "canvas" "get_miterLimit"

/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/miterLimit
pub fn set_miter_limit(self : Canvas2D, limit : Double) = "canvas" "set_miterLimit"

fn get_line_dash_ffi(self : Canvas2D) -> @lib.JS_double_array = "canvas" "getLineDash"

/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/getLineDash
pub fn get_line_dash(self : Canvas2D) -> Array[Double] {
  self.get_line_dash_ffi().to_array().unwrap()
}

fn set_line_dash_ffi(self : Canvas2D, segments : @lib.JS_double_array) = "canvas" "setLineDash"

/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/setLineDash
pub fn set_line_dash(self : Canvas2D, segments : Array[Double]) -> Unit {
  self.set_line_dash_ffi(@lib.JS_double_array::from_array(segments).unwrap())
}

fn set_stroke_style_color_ffi(self : Canvas2D, color : @lib.JS_String) = "canvas" "set_stroke_style"

fn set_stroke_style_gradient_ffi(self : Canvas2D, gradient : CanvasGradient) = "canvas" "set_stroke_style"

fn set_stroke_style_pattern_ffi(self : Canvas2D, pattern : CanvasPattern) = "canvas" "set_stroke_style"

/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/strokeStyle
/// 
/// The parameter is a string parsed as CSS <color> value.
pub fn set_stroke_style_color(self : Canvas2D, style : StrokeFillStyle) -> Unit {
  match style {
    Color(color) =>
      self.set_stroke_style_color_ffi(
        @lib.JS_String::from_string(color).unwrap(),
      )
    Gradient(gradient) => self.set_stroke_style_gradient_ffi(gradient)
    Pattern(pattern) => self.set_stroke_style_pattern_ffi(pattern)
  }
}

fn set_fill_style_color_ffi(self : Canvas2D, color : @lib.JS_String) = "canvas" "set_fill_style"

fn set_fill_style_gradient_ffi(self : Canvas2D, gradient : CanvasGradient) = "canvas" "set_fill_style"

fn set_fill_style_pattern_ffi(self : Canvas2D, pattern : CanvasPattern) = "canvas" "set_fill_style"

/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/fillStyle
/// 
/// The parameter is a string parsed as CSS <color> value.
pub fn set_fill_style_color(self : Canvas2D, style : StrokeFillStyle) -> Unit {
  match style {
    Color(color) =>
      self.set_fill_style_color_ffi(@lib.JS_String::from_string(color).unwrap())
    Gradient(gradient) => self.set_fill_style_gradient_ffi(gradient)
    Pattern(pattern) => self.set_fill_style_pattern_ffi(pattern)
  }
}

/// String | CanvasGradient | CanvasPattern
pub enum StrokeFillStyle {
  Color(String)
  Gradient(CanvasGradient)
  Pattern(CanvasPattern)
}
