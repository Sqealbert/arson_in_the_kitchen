shader_type canvas_item;

void fragment() {
	COLOR = COLOR - vec4(COLOR.r * 0.5, COLOR.g * 0.5, COLOR.b * 0.5, 0);
}
