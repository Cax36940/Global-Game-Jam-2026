shader_type canvas_item;
uniform vec2 p1 = vec2(-0.6, 0.15);
uniform vec2 p2 = vec2(0.6, -0.15);
uniform float width = 0.25;

float sdf_ellipse( vec2 p, vec2 a, vec2 b, float w )
{
    float r = 0.5*length(b-a);
    float d = 0.5*(r*r-w*w)/w;
    vec2 v = (b-a)/r;
    vec2 c = (b+a)*0.5;
    vec2 q = 0.5*abs(mat2(vec2(v.y,v.x),vec2(-v.x,v.y))*(p-c));
    vec3 h = (r*q.x<d*(q.y-r)) ? vec3(0.0,r,0.0) : vec3(-d,0.0,d+w);
    return length( q-h.xy) - h.z;
}

void fragment() {
    vec2 uv = (UV - 0.5) * 2.0;
    float v = sdf_ellipse(uv, p1, p2, width);
    v = step(v, 0);
    COLOR = vec4(vec3(0.0), v);
}