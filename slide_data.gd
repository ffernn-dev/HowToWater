extends Node

var slides = [
	{
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
				"id": "amplitude",
				"min": 0.0,
				"max": 3.0,
				"default": 1.0,
			},
			{
				"type": "slider",
				"name": "Frequency",
				"id": "frequency",
				"min": 0.0,
				"max": 6.5,
				"default": 1.0,
			},
			{
				"type": "slider",
				"name": "Speed",
				"id": "speed",
				"min": -20.0,
				"max": 20.0,
				"default": 1.0,
			},
		]
	}
]
