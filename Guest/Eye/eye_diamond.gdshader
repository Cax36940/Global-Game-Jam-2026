shader_type canvas_item;

uniform float a = 0.75;
uniform float b = 0.4;

float sdf_diamond( in vec2 p, in vec2 v ) 
{
    v.y = -v.y;
    p = abs(p);
    float h = clamp( (dot(v,p)+v.y*v.y)/dot(v,v), 0.0, 1.0 );
    p -= v*vec2(h,h-1.0);
    return length(p)*sign(p.x);
}

void fragment() {
    vec2 uv = (UV - 0.5) * 2.0;
    float v = sdf_diamond(uv, vec2(a, b));
    v = step(v, 0);
    COLOR = vec4(vec3(0.0), v);
}