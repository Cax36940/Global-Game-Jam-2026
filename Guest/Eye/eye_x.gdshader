shader_type canvas_item;

uniform float radius = 0.5;
uniform float width = 0.15;

float sdf_x( in vec2 p, in float w, in float r )
{
    p = abs(p);
    return length(p-min(p.x+p.y,w)*0.5) - r;
}

void fragment() {
    vec2 uv = (UV - 0.5) * 2.0;
    float v = sdf_x(uv, 0.5, 0.15); 
    v = step(v, 0.0);
    COLOR = vec4(vec3(0.0), v);
}