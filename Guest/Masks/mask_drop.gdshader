shader_type canvas_item;

uniform float size = 0.15;
uniform float aa = 0.1;
uniform float bb = 0.1;
uniform	float achamfer = 0.1;
uniform float offset = 0.2;
uniform float radius = 0.1;
uniform vec4 color : source_color = vec4(1.0);

float sdf_drop( vec2 p, float r1, float r2, float h )
{
	p = p.yx;
	p.x += 0.0;
	p.y += 0.1;
    p.x = abs(p.x);
    float b = (r1-r2)/h;
    float a = sqrt(1.0-b*b);
    float k = dot(p,vec2(-b,a));
    if( k < 0.0 ) return length(p) - r1;
    if( k > a*h ) return length(p-vec2(0.0,h)) - r2;
    return dot(p, vec2(a,b) ) - r1;
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
	
    //float v = sdf_square(uv, vec2(size, size * 0.8));
	float v = sdf_drop(uv, aa, bb, achamfer);
    v = step(v, 0);
	v = max(v, v2);
    COLOR = color * v;
}

