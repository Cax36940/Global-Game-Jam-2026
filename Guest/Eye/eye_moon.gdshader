shader_type canvas_item;
uniform float cover = 0.4;
uniform float radius1 = 0.5;
uniform float radius2 = 0.6;

float sdf_moon(vec2 p, float d, float ra, float rb )
{
    float v1 = length(p) - ra;
    float v2 = length(vec2(p.x, p.y - d)) - rb;
    v1 = step(v1, 0.0);
    v2 = step(v2, 0.0);
    return max(1.0-v1,v2);
}

void fragment() {
    vec2 uv = (UV - 0.5) * 2.0;
    float v = sdf_moon(uv, cover, radius1, radius2);
    v = step(v, 0);
    COLOR = vec4(vec3(0.0), v);
}