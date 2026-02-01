shader_type canvas_item;

uniform float radius = 0.15;

float sdf_star( in vec2 p, in float r )
{
    const vec4 k = vec4(-0.5,0.8660254038,0.5773502692,1.7320508076);
    p = abs(p);
    p -= 2.0*min(dot(k.yx,p),0.0)*k.yx;
    p -= 2.0*min(dot(k.xy,p),0.0)*k.xy;
    p -= vec2(clamp(p.x,r*k.z,r*k.w),r);
    return length(p)*sign(p.x);
}

void fragment() {
    vec2 uv = (UV - 0.5) * 2.0;
    float v = sdf_star(uv, radius);
    v = step(v, 0);
    COLOR = vec4(vec3(0.0), v);
}