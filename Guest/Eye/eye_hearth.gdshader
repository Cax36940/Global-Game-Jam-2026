shader_type canvas_item;

uniform float radius = -0.02;

float dot2(vec2 p)
{
    return p.x * p.x + p.y * p.y;
}

float sdf_hearth( in vec2 p )
{
	p.y = -p.y;
    p.y += 0.6;
    p.x = abs(p.x);
    
    if( p.y+p.x>1.0 )
        return sqrt(dot2(p-vec2(0.25,0.75))) - sqrt(2.0)/4.0;
    return sqrt(min(dot2(p-vec2(0.00,1.00)),
                    dot2(p-0.5*max(p.x+p.y,0.0)))) * sign(p.x-p.y);
}

void fragment() {
    vec2 uv = (UV - 0.5) * 2.0;
    float v = sdf_hearth(uv);
    v = step(v, radius);
    COLOR = vec4(vec3(0.0), v);
}