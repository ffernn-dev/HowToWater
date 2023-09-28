extends Node

var slides = [
	{
		"shader": "sum_of_sines",
		"shader_flags": {
			"sine1_enable": true,
			"sine2_enable": false,
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
		"water_mesh_dimensions": Vector3(10, 0.1, 0),
		"global_light": 1.0,
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
				"default": 1.0,
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
		"water_mesh_dimensions": Vector3(10, 0.1, 0),
		"global_light": 1.0,
		"controls": [
			{
				"type": "title",
				"name": "1.1. Multiple Sines",
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
				"max": 3.0,
				"default": 1.0,
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
				"max": 3.0,
				"default": 1.0,
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
			"amplitude1": 0.45,
			"frequency1": 0.84,
			"speed1": 1,
			"rotation1": 0,
			"amplitude2": 0.09,
			"frequency2": 3.66,
			"speed2": 9.94,
			"rotation2": 0
		},
		"camera_position": [Vector3(-3.388, 4.544, 7.124), Vector3(-44, -29.5, 0)],
		"water_mesh_dimensions": Vector3(10, 0.1, 10),
		"global_light": 0.0,
		"controls": [
			{
				"type": "title",
				"name": "1.2. Sines in 3D",
				"id": "main_heading",
			},
			{
				"type": "paragraph",
				"name": "If we take these sine waves and apply them to a plane in 3D, we have the beginnings of a water renderer. Try rotating the movement direction of each wave.",
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
		]
	}
]
