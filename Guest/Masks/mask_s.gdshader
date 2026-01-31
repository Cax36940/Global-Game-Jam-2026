shader_type canvas_item;
uniform vec4 color : source_color = vec4(1.0);

float dot2(vec2 p)
{
    return p.x * p.x + p.y * p.y;
}

float sdf_s(vec2 p)
{
	p = p.yx;
    float six = (p.y<0.0) ? -p.x : p.x;
    p.x = abs(p.x);
    p.y = abs(p.y) - 0.2;
    float rex = p.x - min(round(p.x/0.4),0.4);
    float aby = abs(p.y-0.2)-0.6;
    
    float d = dot2(vec2(six,-p.y)-clamp(0.5*(six-p.y),0.0,0.2));
    d = min(d,dot2(vec2(p.x,-aby)-clamp(0.5*(p.x-aby),0.0,0.4)));
    d = min(d,dot2(vec2(rex,p.y  -clamp(p.y          ,0.0,0.4))));
    
    float s = 2.0*p.x + aby + abs(aby+0.4) - 0.4;
    return sqrt(d) * sign(s);
}

void fragment() {
    vec2 uv = (UV - 0.5) * 2.0;
    float v = sdf_s(uv);
    v = step(v, 0);
    COLOR = v * color;
}

