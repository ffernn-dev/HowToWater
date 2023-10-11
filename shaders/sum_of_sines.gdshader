shader_type spatial;

group_uniforms flags;
uniform bool sine1_enable = true;
uniform bool sine2_enable = false;
uniform bool sine3_enable = false;

group_uniforms params;
uniform float amplitude1 = 1.0;
uniform float frequency1 = 1.0;
uniform float speed1 = 1.0;
uniform float rotation1 : hint_range(0.0, 4.0) = 0.5;

uniform float amplitude2 = 1.0;
uniform float frequency2 = 1.0;
uniform float speed2 = 1.0;
uniform float rotation2 : hint_range(0.0, 4.0) = 0.5;

uniform float rotation3 : hint_range(0.0, 4.0) = 0.5;

float calc_direction(vec3 vert, float rot) {
    rot *= PI/2.0;
    return vert.x*sin(rot) + vert.x*cos(rot) - vert.z*sin(rot) + vert.z*cos(rot);
}

vec3 calc_normal(vec3 vert) {
	float derivative1 = amplitude1 * frequency1 * cos(calc_direction(vert, rotation1) * frequency1 + TIME * speed1);
	float derivative2 = amplitude2 * frequency2 * cos(calc_direction(vert, rotation2) * frequency2 + TIME * speed2);
	float derivative3 = 0.03 * 16.43 * cos(calc_direction(vert, rotation3) * 16.43 + TIME * 13.5);

	float dx = (derivative1 * float(sine1_enable)) + (derivative2 * float(sine2_enable)) + (derivative3 * float(sine3_enable));
	float dz = 0.0; // Assuming no displacement in the z-axis.

	// Calculate the normal by taking the cross product of the partial derivatives.
	vec3 normal = normalize(vec3(-dx, 1.0, -dz));

	return normal;
}


void fragment() {
	ALBEDO = vec3(0.05, 0.5, 0.9);
}

void vertex() {
	float sine1 = amplitude1 * sin(calc_direction(VERTEX, rotation1) * frequency1 + TIME * speed1);
	float sine2 = amplitude2 * sin(calc_direction(VERTEX, rotation2) * frequency2 + TIME * speed2);
	float sine3 = 0.03 * cos(calc_direction(VERTEX, rotation3) * 16.43 + TIME * 10.5);

	VERTEX.y += (sine1 * float(sine1_enable)) + (sine2 * float(sine2_enable)) + (sine3 * float(sine3_enable));

	NORMAL = calc_normal(VERTEX);
}
