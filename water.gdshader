shader_type spatial;

group_uniforms flags;
uniform bool sine1_enable = true;
uniform bool sine2_enable = true;

group_uniforms params;
uniform float amplitude = 1.0;
uniform float frequency = 1.0;
uniform float speed = 1.0;
uniform float rotation : hint_range(0.0, 1.0) = 0.5;

uniform float amplitude2 = 1.0;
uniform float frequency2 = 1.0;
uniform float speed2 = 0.0;
uniform float rotation2 : hint_range(0.0, 1.0) = 0.5;

vec3 calc_normal(float direction) {
	float derivative = amplitude * frequency * cos(direction * frequency + TIME * speed);
	float dx = derivative;
	float dz = 0.0; // Assuming no displacement in the z-axis.

	// Calculate the normal by taking the cross product of the partial derivatives.
	vec3 normal = normalize(vec3(-dx, 1.0, -dz));

	// Transform the normal to world space. You may need to use the inverse transpose
	// of the model matrix if there is scaling and non-uniform transformation.
	return normalize(normal);
}


void fragment() {
	ALBEDO = vec3(0.05, 0.5, 0.9);
}

void vertex() {
	
	float x = VERTEX.x;
    float z = VERTEX.z;
	
	float direction = x*sin(rotation) + x*cos(rotation) - z*sin(rotation) + z*cos(rotation);
	float sine = sin(direction * frequency + TIME * speed);
	VERTEX.y += sine;
	//float sine1 = amplitude * sin(VERTEX.x * frequency + TIME * speed);
	//float sine2 = amplitude2 * sin(VERTEX.x * frequency2 + TIME * speed2);
	//VERTEX.y += (sine1 * float(sine1_enable)) + (sine2 * float(sine2_enable));
	
	NORMAL = calc_normal(direction);
}
