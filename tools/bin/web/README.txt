PvzDevTools independent save tools (wasm32)

Run a local HTTP server in this directory, then open /save-editor.html.
Example: python -m http.server 18105 --bind 127.0.0.1

save-converter.html can also be opened directly for offline conversion.
No game, graphics API, audio, PAK or Memory64 is required.
The standalone editor stores files in its own IndexedDB database. Export files before replacing game saves while the game is closed.
