#!/usr/bin/env fish

echo '// Generated with wrap-css.fish' >src/styles.gleam
echo 'pub const css = "' >>src/styles.gleam
cat priv/styles.css | string replace -a '"' '\\"' >>src/styles.gleam
echo '"' >>src/styles.gleam
