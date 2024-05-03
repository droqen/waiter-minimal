<?php

echo "a = ";
echo filesize("index.pck");
echo ", expected 61888";
echo "<br/>b = ";
echo filesize("indexb.pck");
echo ", expected 62640";
echo "<br/>wasm = ";
echo filesize("index.wasm");
echo ", expected 17865444";