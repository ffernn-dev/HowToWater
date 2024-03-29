extends Node

var slides = [
	{
		"shader": "sum_of_sines",
		"shader_flags": {
			"sine1_enable": true,
			"sine2_enable": false,
			"sine3_enable": false,
			"amplitude1": "_def",
			"frequency1": "_def",
			"speed1": "_def",
			"rotation1": "_def",
			"amplitude2": "_def",
			"frequency2": "_def",
			"speed2": "_def",
			"rotation2": "_def"
		},
		"camera_position": [Vector3(0, 0, 3.6), Vector3(0, 0, 0)],
		"water_mesh_scale": Vector3(1, 1, 0),
		"global_light": 1.0,
		"light": 0.0,
		"controls": [
			{
				"type": "title",
				"name": "1. Sine Waves",
				"id": "main_heading",
			},
			{
				"type": "paragraph",
				"name": "This is a sine wave! It is given by the formula ```f(x) = a * sin(x * f + t * s)/```, where [i]a[/i] is amplitude, [i]f[/i] is frequency, [i]t[/i] is time, and [i]s[/i] is speed.",
				"id": "main_heading",
			},
			{
				"type": "slider",
				"name": "Amplitude",
				"id": "amplitude1",
				"min": 0.0,
				"max": 3.0,
				"default": 0.5,
			},
			{
				"type": "slider",
				"name": "Frequency",
				"id": "frequency1",
				"min": 0.0,
				"max": 6.5,
				"default": 1.0,
			},
			{
				"type": "slider",
				"name": "Speed",
				"id": "speed1",
				"min": -20.0,
				"max": 20.0,
				"default": 1.0,
			},
		]
	},
	{
		"shader": "sum_of_sines",
		"shader_flags": {
			"sine1_enable": true,
			"sine2_enable": true,
			"sine3_enable": false,
			"amplitude1": "_def",
			"frequency1": "_def",
			"speed1": "_def",
			"rotation1": "_def",
			"amplitude2": "_def",
			"frequency2": "_def",
			"speed2": "_def",
			"rotation2": "_def"
		},
		"camera_position": [Vector3(0, 0, 3.6), Vector3(0, 0, 0)],
		"water_mesh_scale": Vector3(1, 1, 0),
		"global_light": 1.0,
		"light": 0.5,
		"controls": [
			{
				"type": "title",
				"name": "2. Multiple Sines",
				"id": "main_heading",
			},
			{
				"type": "paragraph",
				"name": "You you may have noticed that the sine wave behaves a little bit like a rolling ocean swell (only a little bit). The main issue is that it's missing detail. To add more detail into our wave we can add smaller and higher frequency waves to it. Play with the slider to see if you can get a nice looking result",
				"id": "main_heading",
			},
			{
				"type": "slider",
				"name": "Amplitude 1",
				"id": "amplitude1",
				"min": 0.0,
				"max": 1.5,
				"default": 0.25,
			},
			{
				"type": "slider",
				"name": "Frequency 1",
				"id": "frequency1",
				"min": 0.0,
				"max": 6.5,
				"default": 1.0,
			},
			{
				"type": "slider",
				"name": "Speed 1",
				"id": "speed1",
				"min": -20.0,
				"max": 20.0,
				"default": 1.0,
			},
			{
				"type": "slider",
				"name": "Amplitude 2",
				"id": "amplitude2",
				"min": 0.0,
				"max": 1.5,
				"default": 0.25,
			},
			{
				"type": "slider",
				"name": "Frequency 2",
				"id": "frequency2",
				"min": 0.0,
				"max": 6.5,
				"default": 1.0,
			},
			{
				"type": "slider",
				"name": "Speed 2",
				"id": "speed2",
				"min": -20.0,
				"max": 20.0,
				"default": 1.0,
			},
		]
	},
	{
		"shader": "sum_of_sines",
		"shader_flags": {
			"sine1_enable": true,
			"sine2_enable": true,
			"sine3_enable": true,
			"amplitude1": 0.2,
			"frequency1": 0.84,
			"speed1": 1,
			"rotation1": 0,
			"amplitude2": 0.06,
			"frequency2": 1.66,
			"speed2": 9.94,
			"rotation2": 0,
		},
		"camera_position": [Vector3(-3.388, 4.544, 7.124), Vector3(-44, -29.5, 0)],
		"water_mesh_scale": Vector3(1, 1, 1),
		"global_light": 0.0,
		"light": 0.5,
		"controls": [
			{
				"type": "title",
				"name": "3. Sines in 3D",
				"id": "main_heading",
			},
			{
				"type": "paragraph",
				"name": "We can take these sine waves and use them to push a surface up, mimicking the way waves look in an ocean. Try rotating the movement direction of each wave.",
				"id": "main_heading",
			},
			{
				"type": "slider",
				"name": "Rotate 1",
				"id": "rotation1",
				"min": 0.0,
				"max": 4.0,
				"default": 1.0,
			},
			{
				"type": "slider",
				"name": "Rotate 2",
				"id": "rotation2",
				"min": 0.0,
				"max": 4.0,
				"default": 1.0,
			},
			{
				"type": "slider",
				"name": "Rotate 3",
				"id": "rotation3",
				"min": 0.0,
				"max": 4.0,
				"default": 1.0,
			},
		]
	},
	{
		"shader": "fbm",
		"shader_flags": {
			"drag_factor": 0.0,
			"displace_iterations": 1,
			"enable_fresnel": false,
			"low_roughness": false,
			"enable_rim": false,
			"exponential_waves": false,
		},
		"camera_position": [Vector3(-3.388, 4.544, 7.124), Vector3(-44, -29.5, 0)],
		"water_mesh_scale": Vector3(1, 1, 1),
		"global_light": 0.0,
		"light": 0.5,
		"controls": [
			{
				"type": "title",
				"name": "4. Many sines",
				"id": "main_heading",
			},
			{
				"type": "paragraph",
				"name": "As we add more and more of these waves with random directions, and make each wave higher frequency than the last...",
				"id": "main_heading",
			},
			{
				"type": "slider",
				"name": "Number of sine waves",
				"id": "displace_iterations",
				"min": 0.0,
				"max": 34.0,
				"default": 1.0,
			},
			{
				"type": "paragraph",
				"name": "We begin to simulate all the little surface details, building up to a fairly convincing ocean surface at 34 sine waves",
				"id": "main_heading",
			},
		]
	},
	{
		"shader": "fbm",
		"shader_flags": {
			"drag_factor": 0.0,
			"displace_iterations": 34,
			"enable_fresnel": false,
			"low_roughness": false,
			"enable_rim": false,
			"exponential_waves": false,
		},
		"camera_position": [Vector3(2.554, 1.45, -6.675), Vector3(0, 162.1, 0)],
		"water_mesh_scale": Vector3(1, 1, 1),
		"global_light": 0.0,
		"light": 0.0,
		"controls": [
			{
				"type": "title",
				"name": "6. Light interactions",
				"id": "main_heading",
			},
			{
				"type": "paragraph",
				"name": "At the moment our water is just a matte surface. I've turned off the harsh light I was using to visualise everything up until now, so now all the light comes from this environment texture. To make it reflective like water, we can turn down the roughness value, and the game engine's renderer handles reflections for us.",
				"id": "main_heading",
			},
			{
				"type": "checkbox",
				"name": "Low roughness",
				"id": "low_roughness",
				"default": false,
			},
			{
				"type": "paragraph",
				"name": "The fresnel (pronounced fernel) effect says that when surfaces are viewed at glancing angles they become more reflective. The law applies of most physical materials, including water: if you look directly into it down you can see through it, but an ocean viewed from the beach mostly reflects the sky.",
				"id": "main_heading",
			},
			{
				"type": "checkbox",
				"name": "Fresnel reflections",
				"id": "enable_fresnel",
				"default": false,
			},
			{
				"type": "paragraph",
				"name": "We can also turn on rim lighting which increases the light interaction on the edges of a model, emulating tiny surface details.",
				"id": "main_heading",
			},
			{
				"type": "checkbox",
				"name": "Rim lighting",
				"id": "enable_rim",
				"default": false,
			}
		]
	},
	{
		"shader": "fbm",
		"shader_flags": {
			"drag_factor": 0.0,
			"displace_iterations": "_def",
			"enable_fresnel": true,
			"low_roughness": true,
			"enable_rim": true,
			"exponential_waves": false,
		},
		"camera_position": [Vector3(2.554, 1.45, -6.675), Vector3(0, 162.1, 0)],
		"water_mesh_scale": Vector3(1, 1, 1),
		"global_light": 0.0,
		"light": 0.0,
		"controls": [
			{
				"type": "title",
				"name": "5. Waves drag waves",
				"id": "main_heading",
			},
			{
				"type": "paragraph",
				"name": "We can use the derivative of each wave to \"push\" the next wave around, making it look more like a swell interacting with itself.",
				"id": "main_heading",
			},
			{
				"type": "slider",
				"name": "Number of sine waves",
				"id": "displace_iterations",
				"min": 0.0,
				"max": 34.0,
				"default": 1.0,
			},
			{
				"type": "slider",
				"name": "\"Drag\" Factor",
				"id": "drag_factor",
				"min": 0.0,
				"max": 1.0,
				"default": 0.0,
			},
			{
				"type": "paragraph",
				"name": "Another way to improve realism is to make the waves steeper/sharper. This can be done by applying the exponential funcion ```eⁿ/``` to the sine waves. Try setting the number of waves to 1 to see the effect better.",
				"id": "main_heading",
			},
			{
				"type": "checkbox",
				"name": "Enable exponential waves",
				"id": "exponential_waves",
				"default": false,
			}
		]
	},
]
