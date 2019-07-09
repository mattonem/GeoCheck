"
A GeoCheckAngleTest is a test class for testing the behavior of GeoCheckAngle
"
Class {
	#name : #GeoCheckAngleTest,
	#superclass : #TestCase,
	#category : #'GeoCheck-Tests'
}

{ #category : #tests }
GeoCheckAngleTest >> testBasicAngles [
	| anAngle |
	anAngle := 90 deg.
	self assert: anAngle rad closeTo: 1.5708.
	anAngle := (Float pi / 2) rad.
	self assert: anAngle degree closeTo: 90.
	anAngle := 180 deg.
	self assert: anAngle rad closeTo: 3.14159.
	anAngle := (Float pi) rad.
	self assert: anAngle degree closeTo: 180.
	anAngle := 45 deg.
	self assert: anAngle rad closeTo: 0.785398.
]
