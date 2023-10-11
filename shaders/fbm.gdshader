shader_type spatial;
render_mode specular_toon;

uniform float drag_factor = 0.38;
uniform int displace_iterations = 34;
uniform bool enable_fresnel = true;
uniform bool low_roughness = true;
uniform bool enable_rim = true;

uniform bool exponential_waves = true;

// Calculates wave value and its derivative
vec2 wave_dx(vec2 position, vec2 direction, float frequency, float timeshift) {
	float x = dot(direction, position) * frequency + timeshift;
	float sinx = sin(x);
	float wave = ((exp(sinx - 1.0) - 0.5) * float(exponential_waves)) + (sinx / 2.0 * float(!exponential_waves));
	float dx = wave * cos(x);
	return vec2(wave, -dx);
}

vec3 get_waves(vec2 position, int iterations) {
	lowp float iter = 0.0; // This will help generating well distributed wave directions
	float frequency = 1.0;
	float time_multiplier = 1.0;
	float weight = 1.0;
	float sum = 0.0;
	vec2 deriv_sum = vec2(0.0);
	float weight_sum = 0.0;
	for(int i=0; i < iterations; i++) {
		vec2 direction = vec2(sin(iter), cos(iter)); // Random-ish wave direction
		vec2 wave = wave_dx(position, direction, frequency, TIME * time_multiplier);
		// shift position around according to wave drag and derivative of the wave
		position += direction * wave.y * weight * drag_factor;

		sum += wave.x * weight;
		deriv_sum += vec2(wave.y * direction.x, wave.y * direction.y) * weight * frequency;
		weight_sum += weight;

		weight *= 0.82;
		frequency *= 1.18;
		time_multiplier *= 1.07;

		// add some kind of random value to make next wave look random too
		iter += 2.399963;
	}
	// calculate and return
	return vec3(sum / weight_sum, deriv_sum);
}

void fragment() {
	float fresnel = sqrt(1.0 - dot(NORMAL, VIEW));
	RIM = 0.2 * float(enable_rim);
	ROUGHNESS = 0.01 * (1.0 - (float(enable_fresnel) * fresnel)) + (0.99 * float(!low_roughness));
	ALBEDO = vec3(0.1, 0.3, 0.5) + ((0.1 * fresnel) * float(enable_fresnel));

}

void vertex() {
	vec3 fbm = get_waves(VERTEX.xz, displace_iterations);
	VERTEX.y += fbm.x;
	NORMAL = normalize(vec3(fbm.y, 5.7, fbm.z)); // No goddamn clue why 5.7 makes it look way better than 1.0 grrr
}
