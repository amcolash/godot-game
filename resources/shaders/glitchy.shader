shader_type canvas_item;

uniform float size_x=0.008;
uniform float size_y=0.008;

void fragment() {
	vec2 uv = SCREEN_UV;
    vec2 offset = vec2(cos(TIME) / 2.0, sin(TIME) / 1.5);
	uv-=mod(uv,vec2(size_x * offset.x, size_y * offset.y));
	
	COLOR.rgb= textureLod(SCREEN_TEXTURE,uv,0.0).rgb;
}