/// @description string_hash_to_newline(str)
/// @param str The string to convert
/// Compatibility shim: GMS1 string_hash_to_newline() replaced # with newlines.
/// GMS2.3+ removed this built-in. This wrapper restores the behaviour.
function string_hash_to_newline(str) {
	return string_replace_all(str, "#", "\n");
}
