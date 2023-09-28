shader_type spatial;

group_uniforms flags;
uniform bool sine1_enable = true;
uniform bool sine2_enable = true;

group_uniforms params;
uniform float base_amplitude = 0.1;
uniform float base_frequency = 1.0;
uniform float speed = 3.0;

float calc_direction(vec3 vert, float rot) {
    rot *= PI/2.0;
    return vert.x*sin(rot) + vert.x*cos(rot) - vert.z*sin(rot) + vert.z*cos(rot);
}

float hash(vec2 p) {
    return fract(sin(dot(p, vec2(12.9898,78.233))) * 43758.5453123);
}

vec3 calc_normal(vec3 vert, float amplitude, float frequency, float direction) {
    float dx = frequency * amplitude * 100.0 * cos(direction * frequency + TIME * speed);
	float dz = 0.0; // Assuming no displacement in the z-axis.

	vec3 normal = normalize(vec3(-dx, 1.0, -dz));

	return normal;
}


void fragment() {
	ALBEDO = vec3(0.05, 0.5, 0.9);
}

float when_eq(float x, float y) {
  return 1.0 - abs(sign(x - y));
}

void vertex() {
	float fbm = 0.0;
    for(int i = 0; i < 32; i++) {
        float iteration = float(i);
        float amplitude = base_amplitude * pow(0.8, iteration);
        float frequency = base_frequency * pow(1.5, iteration);
        float direction = calc_direction(VERTEX, hash(vec2(iteration)));

        fbm += amplitude * sin(direction * frequency + TIME * speed);
        NORMAL += calc_normal(VERTEX, amplitude, frequency, direction);
    }

	VERTEX.y += fbm;

}
