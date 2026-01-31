shader_type canvas_item;

uniform float size = 0.15;
uniform float offset = 0.2;
uniform float radius = 0.1;
uniform vec4 color : source_color = vec4(1.0);

float sdf_square(vec2 p, vec2 b )
{
    vec2 d = abs(p)-b;
    return length(max(d,0.0)) + min(max(d.x,d.y),0.0) - radius;
}

float sdf_diamond(vec2 p, vec2 b ) 
{
	p.y -= 0.15;
    b.y = -b.y;
    p = abs(p);
    float h = clamp( (dot(b,p)+b.y*b.y)/dot(b,b), 0.0, 1.0 );
    p -= b*vec2(h,h-1.0);
    return length(p)*sign(p.x) - radius * 0.8;
}

void fragment() {
    vec2 uv = (UV - 0.5) * 2.0;
	
	float v2 = sdf_diamond(uv, vec2(size*1.2, size * 0.8));
    v2 = step(v2, 0);
	
	uv.x = abs(uv.x);
	uv.x -= offset;
	
    float v = sdf_square(uv, vec2(size, size * 0.8));
    v = step(v, 0);
	v = max(v, v2);
    COLOR = color * v;
}

