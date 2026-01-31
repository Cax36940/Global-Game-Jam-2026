shader_type canvas_item;
uniform float radius = 0.5;

float sdf_circle(vec2 p, float r)
{
    return length(p) - r;
}

void fragment() {
    vec2 uv = (UV - 0.5) * 2.0;
    float v = sdf_circle(uv, radius);
    v = step(v, 0.0);
    COLOR = vec4(vec3(0.0), v);
}