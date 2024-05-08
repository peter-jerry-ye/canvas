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
/// CanvasPattern
/// 
/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasPattern
pub type CanvasPattern

/// CanvasGradient
/// 
/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasGradient
pub type CanvasGradient

/// Path2D
/// 
/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/Path2D
pub type Path2D

pub enum LineJoin {
  Bevel
  Miter
  Round
}

pub fn to_string(self : LineJoin) -> String {
  match self {
    Bevel => "bevel"
    Miter => "miter"
    Round => "round"
  }
}

pub enum LineCap {
  Butt
  Round
  Square
}

pub fn to_string(self : LineCap) -> String {
  match self {
    Butt => "butt"
    Round => "round"
    Square => "square"
  }
}

/// Reference: https://developer.mozilla.org/en-US/docs/Web/API/CanvasRenderingContext2D/fill
pub enum FillRule {
  Nonzero
  Evenodd
}

pub fn to_string(self : FillRule) -> String {
  match self {
    Nonzero => "nonzero"
    Evenodd => "evenodd"
  }
}
