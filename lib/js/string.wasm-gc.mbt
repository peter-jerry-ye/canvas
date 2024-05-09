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
type JS_String

fn string_load_ffi(offset : Int, length : Int) -> JS_String = "peter-jerry-ye:canvas/String" "load"

fn string_store_ffi(string : JS_String, offset : Int) = "peter-jerry-ye:canvas/String" "store"

pub fn length(self : JS_String) -> Int = "peter-jerry-ye:canvas/String" "length"

pub fn log(self : JS_String) = "peter-jerry-ye:canvas/String" "log"

pub fn JS_String::empty() -> JS_String = "peter-jerry-ye:canvas/String" "empty"

pub fn JS_String::from_string(str : String) -> Option[JS_String] {
  if str.length() == 0 {
    return Some(JS_String::empty())
  }
  let memory = @memory.allocate(str.length() * 2)?
  memory.store_bytes(str.to_bytes())
  let str = string_load_ffi(memory.offset, str.length())
  memory.free()?
  Some(str)
}

pub fn JS_String::to_string(str : JS_String) -> Option[String] {
  if str.length() == 0 {
    return Some("")
  }
  let memory = @memory.allocate(str.length() * 2)?
  string_store_ffi(str, memory.offset)
  let str = memory.load_bytes().to_string()
  memory.free()?
  Some(str)
}
