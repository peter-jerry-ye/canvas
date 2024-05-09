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

import ffi from './import.mjs';
class MoonBitCanvas extends HTMLCanvasElement {
    constructor() {
        super();
        const wasm_url = this.attributes.getNamedItem("src")?.value
        if (wasm_url) {
            const context = this.getContext("2d")
            let memory
            const importObject = {
                ...ffi(() => memory)
            };
            WebAssembly.instantiateStreaming(fetch(wasm_url), importObject).then(
                (obj) => {
                    memory = (obj.instance.exports["moonbit.memory"]);
                    obj.instance.exports._start();
                    obj.instance.exports.entry(context, new Date().getTime());
                }
            )
        }
    }
}

customElements.define("moonbit-canvas", MoonBitCanvas, { extends: "canvas" })

