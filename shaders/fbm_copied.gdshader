shader_type spatial;
render_mode specular_toon;

uniform float drag_factor = 0.38;
uniform int displace_iterations = 16;
uniform int normal_iterations = 34;

// Calculates wave value and its derivative
vec2 wave_dx(vec2 position, vec2 direction, float frequency, float timeshift) {
  float x = dot(direction, position) * frequency + timeshift;
  float wave = exp(sin(x) - 1.0);
  float dx = wave * cos(x);
  return vec2(wave, -dx);
}

vec3 get_waves(vec2 position, int iterations) {
  float iter = 0.0; // This will help generating well distributed wave directions
  float frequency = 1.0;
  float time_multiplier = 2.0;
  float weight = 1.0;
  float sum = 0.0;
  vec2 deriv_sum = vec2(0.0);
  float weights_sum = 0.0;
  for(int i=0; i < iterations; i++) {
      vec2 direction = vec2(sin(iter), cos(iter)); // Random-ish wave direction
      vec2 wave = wave_dx(position, direction, frequency, 1.0 * time_multiplier);

      // shift position around according to wave drag and derivative of the wave
      position += direction * wave.y * weight * drag_factor;

      sum += wave.x * weight;
      deriv_sum += vec2(wave.y * direction.x, wave.y * direction.y) * weight * frequency;
      weights_sum += weight;

      // modify next octave parameters
      weight *= 0.82;
      frequency *= 1.18;
      time_multiplier *= 1.07;

      // add some kind of random value to make next wave look random too
      iter += 1232.399963;
  }
  // calculate and return
  return vec3(sum / weights_sum, deriv_sum);
}

// vec3 normal(vec2 pos, float e, float depth) {
//   vec2 ex = vec2(e, 0);
//   float H = get_waves(pos, normal_iterations).x * depth;
//   vec3 a = vec3(pos.x, H, pos.y);
//   return normalize(
//     cross(
//       a - vec3(pos.x - e, get_waves(pos.xy - ex.xy, normal_iterations).x * depth, pos.y),
//       a - vec3(pos.x, get_waves(pos.xy + ex.yx, normal_iterations).x * depth, pos.y + e)
//     )
//   );
// }

void fragment() {
    float fresnel = sqrt(1.0 - dot(NORMAL, VIEW));
    RIM = 0.2;
    ROUGHNESS = 0.01 * (1.0 - fresnel);
    ALBEDO = vec3(0.1, 0.3, 0.5) + (0.1 * fresnel);
    vec4 Wn = INV_VIEW_MATRIX * vec4( NORMAL, 0.0 );
    Wn = inverse( MODEL_MATRIX ) * Wn;
    //ALBEDO = ( Wn.rgb + 1.0 )/2.0;
}

void vertex() {
    vec3 fbm = get_waves(VERTEX.xz, displace_iterations);
	VERTEX.y += fbm.x;
	NORMAL = normalize(vec3(fbm.y, 1.0, fbm.z));
}
