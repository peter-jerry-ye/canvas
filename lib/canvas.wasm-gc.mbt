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

/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/strokeRect
pub fn stroke_rect(
  self : Canvas2D,
  x : Double,
  y : Double,
  width : Double,
  height : Double
) = "peter-jerry-ye:canvas/Canvas2D" "strokeRect"

/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/fillRect
pub fn fill_rect(
  self : Canvas2D,
  x : Double,
  y : Double,
  width : Double,
  height : Double
) = "peter-jerry-ye:canvas/Canvas2D" "fillRect"

/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/clearRect
pub fn clear_rect(
  self : Canvas2D,
  x : Double,
  y : Double,
  width : Double,
  height : Double
) = "peter-jerry-ye:canvas/Canvas2D" "clearRect"

/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/beginPath
pub fn begin_path(self : Canvas2D) = "peter-jerry-ye:canvas/Canvas2D" "beginPath"

/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/closePath
pub fn close_path(self : Canvas2D) = "peter-jerry-ye:canvas/Canvas2D" "closePath"

/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/moveTo
pub fn move_to(self : Canvas2D, x : Double, y : Double) = "peter-jerry-ye:canvas/Canvas2D" "moveTo"

/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/lineTo
pub fn line_to(self : Canvas2D, x : Double, y : Double) = "peter-jerry-ye:canvas/Canvas2D" "lineTo"

fn stroke_ffi(self : Canvas2D) = "peter-jerry-ye:canvas/Canvas2D" "stroke"

fn stroke_path_ffi(self : Canvas2D, path : Path2D) = "peter-jerry-ye:canvas/Canvas2D" "stroke"

/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/stroke
pub fn stroke(self : Canvas2D, ~path : Path2D? = None) -> Unit {
  match path {
    None => self.stroke_ffi()
    Some(path) => self.stroke_path_ffi(path)
  }
}

fn fill_ffi(self : Canvas2D) = "peter-jerry-ye:canvas/Canvas2D" "fill"

fn fill_fillRule_ffi(self : Canvas2D, fillRule : @lib.JS_String) = "peter-jerry-ye:canvas/Canvas2D" "fill"

fn fill_path_ffi(self : Canvas2D, path : Path2D) = "peter-jerry-ye:canvas/Canvas2D" "fill_path"

fn fill_path_fillRule_ffi(
  self : Canvas2D,
  path : Path2D,
  fillRule : @lib.JS_String
) = "peter-jerry-ye:canvas/Canvas2D" "fill_path"

/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/fill
pub fn fill(
  self : Canvas2D,
  ~path : Path2D? = None,
  ~fillRule : CanvasFillRule? = None
) -> Unit {
  match (path, fillRule) {
    (None, None) => self.fill_ffi()
    (Some(path), None) => self.fill_path_ffi(path)
    (None, Some(fillRule)) =>
      self.fill_fillRule_ffi(@lib.JS_String::from_string(fillRule.to_string()))
    (Some(path), Some(fillRule)) =>
      self.fill_path_fillRule_ffi(
        path,
        @lib.JS_String::from_string(fillRule.to_string()),
      )
  }
}

fn fill_text_ffi(
  self : Canvas2D,
  text : @lib.JS_String,
  x : Double,
  y : Double
) = "peter-jerry-ye:canvas/Canvas2D" "fillText"

fn fill_text_maxwidth_ffi(
  self : Canvas2D,
  text : @lib.JS_String,
  x : Double,
  y : Double,
  max_width : Double
) = "peter-jerry-ye:canvas/Canvas2D" "fillText"

/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/fillText
pub fn fill_text(
  self : Canvas2D,
  text : String,
  x : Double,
  y : Double,
  ~max_width : Double? = None
) -> Unit {
  match max_width {
    None => self.fill_text_ffi(@lib.JS_String::from_string(text), x, y)
    Some(max_width) =>
      self.fill_text_maxwidth_ffi(
        @lib.JS_String::from_string(text),
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
) = "peter-jerry-ye:canvas/Canvas2D" "strokeText"

fn stroke_text_maxwidth_ffi(
  self : Canvas2D,
  text : @lib.JS_String,
  x : Double,
  y : Double,
  max_width : Double
) = "peter-jerry-ye:canvas/Canvas2D" "strokeText"

/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/strokeText
pub fn stroke_text(
  self : Canvas2D,
  text : String,
  x : Double,
  y : Double,
  ~max_width : Double? = None
) -> Unit {
  match max_width {
    None => self.stroke_text_ffi(@lib.JS_String::from_string(text), x, y)
    Some(max_width) =>
      self.stroke_text_maxwidth_ffi(
        @lib.JS_String::from_string(text),
        x,
        y,
        max_width,
      )
  }
}

/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/lineWidth
pub fn get_line_width(self : Canvas2D) -> Double = "peter-jerry-ye:canvas/Canvas2D" "get_lineWidth"

/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/lineWidth
pub fn set_line_width(self : Canvas2D, width : Double) = "peter-jerry-ye:canvas/Canvas2D" "set_lineWidth"

fn get_line_cap_ffi(self : Canvas2D) -> @lib.JS_String = "peter-jerry-ye:canvas/Canvas2D" "get_lineCap"

/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/lineCap
pub fn get_line_cap(self : Canvas2D) -> CanavsLineCap {
  match @lib.JS_String::to_string(self.get_line_cap_ffi()) {
    "butt" => CanavsLineCap::Butt
    "round" => CanavsLineCap::Round
    "square" => CanavsLineCap::Square
    _ => abort("Invalid line cap value.")
  }
}

fn set_line_cap_ffi(self : Canvas2D, cap : @lib.JS_String) = "peter-jerry-ye:canvas/Canvas2D" "set_lineCap"

/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/lineCap
pub fn set_line_cap(self : Canvas2D, cap : CanavsLineCap) -> Unit {
  self.set_line_cap_ffi(@lib.JS_String::from_string(cap.to_string()))
}

fn get_line_join_ffi(self : Canvas2D) -> @lib.JS_String = "peter-jerry-ye:canvas/Canvas2D" "get_lineJoin"

/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/lineJoin
/// 
/// `join` is one of : "round" "bevel" "miter
pub fn get_line_join(self : Canvas2D) -> CanvasLineJoin {
  match get_line_join_ffi(self).to_string() {
    "round" => CanvasLineJoin::Round
    "bevel" => CanvasLineJoin::Bevel
    "miter" => CanvasLineJoin::Miter
    _ => abort("Invalid line join value.")
  }
}

fn set_line_join_ffi(self : Canvas2D, join : @lib.JS_String) = "peter-jerry-ye:canvas/Canvas2D" "set_lineJoin"

/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/lineJoin
/// 
/// `join` is one of : "round" "bevel" "miter"
pub fn set_line_join(self : Canvas2D, join : CanvasLineJoin) -> Unit {
  self.set_line_join_ffi(@lib.JS_String::from_string(join.to_string()))
}

/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/miterLimit
pub fn get_miter_limit(self : Canvas2D) -> Double = "peter-jerry-ye:canvas/Canvas2D" "get_miterLimit"

/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/miterLimit
pub fn set_miter_limit(self : Canvas2D, limit : Double) = "peter-jerry-ye:canvas/Canvas2D" "set_miterLimit"

fn get_line_dash_ffi(self : Canvas2D) -> @lib.JS_double_array = "peter-jerry-ye:canvas/Canvas2D" "getLineDash"

/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/getLineDash
pub fn get_line_dash(self : Canvas2D) -> Array[Double] {
  self.get_line_dash_ffi().to_array()
}

fn set_line_dash_ffi(self : Canvas2D, segments : @lib.JS_double_array) = "peter-jerry-ye:canvas/Canvas2D" "setLineDash"

/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/setLineDash
pub fn set_line_dash(self : Canvas2D, segments : Array[Double]) -> Unit {
  self.set_line_dash_ffi(@lib.JS_double_array::from_array(segments))
}

fn set_stroke_style_color_ffi(self : Canvas2D, color : @lib.JS_String) = "peter-jerry-ye:canvas/Canvas2D" "set_stroke_style"

fn set_stroke_style_gradient_ffi(self : Canvas2D, gradient : CanvasGradient) = "peter-jerry-ye:canvas/Canvas2D" "set_stroke_style"

fn set_stroke_style_pattern_ffi(self : Canvas2D, pattern : CanvasPattern) = "peter-jerry-ye:canvas/Canvas2D" "set_stroke_style"

/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/strokeStyle
/// 
/// The parameter is a string parsed as CSS <color> value.
pub fn set_stroke_style(self : Canvas2D, style : CanvasStrokeFillStyle) -> Unit {
  match style {
    Color(color) =>
      self.set_stroke_style_color_ffi(@lib.JS_String::from_string(color))
    Gradient(gradient) => self.set_stroke_style_gradient_ffi(gradient)
    Pattern(pattern) => self.set_stroke_style_pattern_ffi(pattern)
  }
}

fn set_fill_style_color_ffi(self : Canvas2D, color : @lib.JS_String) = "peter-jerry-ye:canvas/Canvas2D" "set_fill_style"

fn set_fill_style_gradient_ffi(self : Canvas2D, gradient : CanvasGradient) = "peter-jerry-ye:canvas/Canvas2D" "set_fill_style"

fn set_fill_style_pattern_ffi(self : Canvas2D, pattern : CanvasPattern) = "peter-jerry-ye:canvas/Canvas2D" "set_fill_style"

/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/fillStyle
/// 
/// The parameter is a string parsed as CSS <color> value.
pub fn set_fill_style(self : Canvas2D, style : CanvasStrokeFillStyle) -> Unit {
  match style {
    Color(color) =>
      self.set_fill_style_color_ffi(@lib.JS_String::from_string(color))
    Gradient(gradient) => self.set_fill_style_gradient_ffi(gradient)
    Pattern(pattern) => self.set_fill_style_pattern_ffi(pattern)
  }
}

fn set_font_ffi(self : Canvas2D, font : @lib.JS_String) = "peter-jerry-ye:canvas/Canvas2D" "set_font"

/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/font
pub fn set_font(self : Canvas2D, font : String) -> Unit {
  self.set_font_ffi(@lib.JS_String::from_string(font))
}

fn draw_image_html_image_element_ffi(
  self : Canvas2D,
  image : HTMLImageElement,
  dx : Double,
  dy : Double
) = "peter-jerry-ye:canvas/Canvas2D" "drawImage"

fn draw_image_dim_html_image_element_ffi(
  self : Canvas2D,
  image : HTMLImageElement,
  dx : Double,
  dy : Double,
  d_width : Double,
  d_height : Double
) = "peter-jerry-ye:canvas/Canvas2D" "drawImage_dim"

fn draw_image_sub_html_image_element_ffi(
  self : Canvas2D,
  image : HTMLImageElement,
  sx : Double,
  sy : Double,
  s_width : Double,
  s_height : Double,
  dx : Double,
  dy : Double,
  d_width : Double,
  d_height : Double
) = "peter-jerry-ye:canvas/Canvas2D" "drawImage_sub"

fn draw_image_html_canvas_element_ffi(
  self : Canvas2D,
  image : HTMLCanvasElement,
  dx : Double,
  dy : Double
) = "peter-jerry-ye:canvas/Canvas2D" "drawImage"

fn draw_image_dim_html_canvas_element_ffi(
  self : Canvas2D,
  image : HTMLCanvasElement,
  dx : Double,
  dy : Double,
  d_width : Double,
  d_height : Double
) = "peter-jerry-ye:canvas/Canvas2D" "drawImage_dim"

fn draw_image_sub_html_canvas_element_ffi(
  self : Canvas2D,
  image : HTMLCanvasElement,
  sx : Double,
  sy : Double,
  s_width : Double,
  s_height : Double,
  dx : Double,
  dy : Double,
  d_width : Double,
  d_height : Double
) = "peter-jerry-ye:canvas/Canvas2D" "drawImage_sub"

/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/drawImage
/// 
/// 3-argument syntax
pub fn draw_image(
  self : Canvas2D,
  image : CanvasImageSource,
  dx : Double,
  dy : Double
) -> Unit {
  match image {
    HTMLImageElement(image) =>
      self.draw_image_html_image_element_ffi(image, dx, dy)
    HTMLCanvasElement(image) =>
      self.draw_image_html_canvas_element_ffi(image, dx, dy)
  }
}

/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/drawImage
/// 
/// 5-argument syntax
pub fn draw_image_with_dimension(
  self : Canvas2D,
  image : CanvasImageSource,
  dx : Double,
  dy : Double,
  dwidth : Double,
  dheight : Double
) -> Unit {
  match image {
    HTMLImageElement(image) =>
      self.draw_image_dim_html_image_element_ffi(image, dx, dy, dwidth, dheight)
    HTMLCanvasElement(image) =>
      self.draw_image_dim_html_canvas_element_ffi(
        image, dx, dy, dwidth, dheight,
      )
  }
}

/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/drawImage
/// 
/// 7-argument syntax
pub fn draw_image_subpart_with_dimention(
  self : Canvas2D,
  image : CanvasImageSource,
  sx : Double,
  sy : Double,
  swidth : Double,
  sheight : Double,
  dx : Double,
  dy : Double,
  dwidth : Double,
  dheight : Double
) -> Unit {
  match image {
    HTMLImageElement(image) =>
      self.draw_image_sub_html_image_element_ffi(
        image, sx, sy, swidth, sheight, dx, dy, dwidth, dheight,
      )
    HTMLCanvasElement(image) =>
      self.draw_image_sub_html_canvas_element_ffi(
        image, sx, sy, swidth, sheight, dx, dy, dwidth, dheight,
      )
  }
}

/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/scale
pub fn scale(self : Canvas2D, x : Double, y : Double) = "peter-jerry-ye:canvas/Canvas2D" "scale"
