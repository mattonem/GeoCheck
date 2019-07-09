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
	anAngle := GeoCheckAngle degreeAngle: 90.
	self assert: anAngle degree equals: 90.
	self assert: anAngle rad closeTo: 1.5708.
	anAngle := GeoCheckAngle degreeAngle: 180.
	self assert: anAngle rad closeTo: 3.14159.
	anAngle := GeoCheckAngle degreeAngle: 45.
	self assert: anAngle rad closeTo: 0.785398.
]
