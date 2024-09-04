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
pub type JS_double_array

pub fn JS_double_array::from_array(arr : Array[Double]) -> JS_double_array {
  let memory = @memory.allocate(arr.length() * 8).unwrap()
  for i = 0; i < arr.length(); i = i + 1 {
    memory.store64(i * 8, arr[i].reinterpret_as_i64()).unwrap()
  }
  let array = float64_array_load_ffi(memory.offset, memory.length)
  memory.free().unwrap()
  array
}

pub fn JS_double_array::to_array(arr : JS_double_array) -> Array[Double] {
  if arr.length() == 0 {
    []
  } else {
    let memory = @memory.allocate(arr.length() * 8).unwrap()
    float64_array_store_ffi(arr, memory.offset)
    let array = Array::make(arr.length(), 0.0)
    for i = 0; i < arr.length(); i = i + 1 {
      array[i] = memory.load64(i * 8).unwrap().reinterpret_as_double()
    }
    memory.free().unwrap()
    array
  }
}

fn float64_array_load_ffi(offset : Int, length : Int) -> JS_double_array = "peter-jerry-ye:canvas/Array" "load_float64_array"

fn float64_array_store_ffi(array : JS_double_array, offset : Int) = "peter-jerry-ye:canvas/Array" "store_float64_array"

pub fn JS_double_array::length(self : JS_double_array) -> Int = "peter-jerry-ye:canvas/Array" "length"

pub fn JS_double_array::empty() -> JS_double_array = "peter-jerry-ye:canvas/Array" "empty"
