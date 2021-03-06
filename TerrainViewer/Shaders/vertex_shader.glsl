#version 430

uniform struct Terrain
{
	sampler2D height_texture;
	sampler2D normal_texture;
	sampler2D lightMap_texture;
	float height;
	float width;
	int resolution_height;
	int resolution_width;
	float max_altitude;
} terrain;

in vec3 pos_attrib;

float height(const vec2 p)
{
	const vec2 texcoord = vec2(p.x / terrain.width, p.y / terrain.height);
	return texture(terrain.height_texture, texcoord).s;
}

void main()
{
	const float z = height(pos_attrib.xy);
	gl_Position = vec4(pos_attrib.xy, z, 1.0);
}