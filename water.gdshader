shader_type spatial;

uniform float amplitude = 1.0;
uniform float frequency = 1.0;
uniform float speed = 1.0;

vec3 calc_normal(vec3 vertex) {
	float dx = amplitude * frequency * cos(vertex.x * frequency + TIME * speed);
	float dz = 0.0; // Assuming no displacement in the z-axis.

	// Calculate the normal by taking the cross product of the partial derivatives.
	vec3 normal = normalize(vec3(-dx, 1.0, -dz));

	// Transform the normal to world space. You may need to use the inverse transpose
	// of the model matrix if there is scaling and non-uniform transformation.
	return normalize(normal);
}


void fragment() {
	ALBEDO = vec3(1.0);
}

void vertex() {
	float displacement1 = amplitude * sin(VERTEX.x * frequency + TIME * speed);
	VERTEX.y += displacement1;
	
	NORMAL = calc_normal(VERTEX);
}
