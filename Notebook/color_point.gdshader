shader_type canvas_item;

uniform float radius = 0.1;
uniform vec4 color : source_color = vec4(1.0);

float sdf_circle(vec2 p)
{
    return length(p) - radius;
}

void fragment() {
    vec2 uv = (UV - 0.5) * 2.0;
	
    float v = sdf_circle(uv);
    v = step(v, 0.5);
    COLOR = v * color;
}