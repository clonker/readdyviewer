#version 430 core

// input vertex attributes
layout (location = 0) in vec2 vPosition;
layout (location = 1) in vec3 particlePosition;

// projection and view matrix
layout (binding = 0, std140) uniform TransformationBlock {
	mat4 viewmat;
	mat4 projmat;
	mat4 invviewmat;
};

// output to the fragment shader
out vec3 fPosition;
out vec3 fColor;
out vec2 fTexcoord;
out float fRadius;

void main (void)
{
	// pass data to the fragment shader
	vec4 pos = viewmat * vec4 (particlePosition, 1.0);
	pos.xy += vPosition;
	fPosition = pos.xyz;
	fTexcoord = vPosition;
	fColor = vec3 (0.25, 0, 1);
	// compute and output the vertex position
	// after view transformation and projection
	pos = projmat * pos;
	gl_Position = pos;
	fRadius = .6;
}
