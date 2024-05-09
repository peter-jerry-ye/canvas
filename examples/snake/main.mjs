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
import ffi from './.mooncakes/peter-jerry-ye/canvas/import.mjs';
const canvas = (document.getElementById("canvas"));
const context = canvas?.getContext("2d")
if (!canvas || !context) {
    throw Error("Canvas not found");
}
const WIDTH = 480
const HEIGHT = WIDTH

canvas.width = WIDTH
canvas.height = HEIGHT

context.scale(24, 24)

let memory

const importObject = {
    ...ffi(() => memory)
};

WebAssembly.instantiateStreaming(fetch("target/wasm-gc/release/build/game/game.wasm"), importObject).then(
    (obj) => {
        memory = (obj.instance.exports["moonbit.memory"]);
        obj.instance.exports._start();
        obj.instance.exports.entry(context, new Date().getTime());
    }
)