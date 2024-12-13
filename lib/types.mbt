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
pub(all) type Canvas2D

/// CanvasPattern
/// 
/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasPattern
pub(all) type CanvasPattern

/// CanvasGradient
/// 
/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasGradient
pub(all) type CanvasGradient

/// Path2D
/// 
/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/Path2D
pub(all) type Path2D

pub(all) enum CanvasLineJoin {
  Bevel
  Miter
  Round
}

pub fn to_string(self : CanvasLineJoin) -> String {
  match self {
    Bevel => "bevel"
    Miter => "miter"
    Round => "round"
  }
}

pub(all) enum CanavsLineCap {
  Butt
  Round
  Square
}

pub fn to_string(self : CanavsLineCap) -> String {
  match self {
    Butt => "butt"
    Round => "round"
    Square => "square"
  }
}

/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/fill
pub(all) enum CanvasFillRule {
  Nonzero
  Evenodd
}

pub fn to_string(self : CanvasFillRule) -> String {
  match self {
    Nonzero => "nonzero"
    Evenodd => "evenodd"
  }
}

/// String | CanvasGradient | CanvasPattern
pub(all) enum CanvasStrokeFillStyle {
  Color(String)
  Gradient(CanvasGradient)
  Pattern(CanvasPattern)
}

pub(all) type KeyboardEvent

pub(all) type MouseEvent

pub(all) type WheelEvent

pub(all) type HTMLImageElement

pub(all) type HTMLCanvasElement

pub(all) enum CanvasImageSource {
  HTMLImageElement(HTMLImageElement)
  HTMLCanvasElement(HTMLCanvasElement)
}
