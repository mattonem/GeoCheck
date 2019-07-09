"
A GeoCheckPositionTest is a test class for testing the behavior of GeoCheckPosition
"
Class {
	#name : #GeoCheckPositionTest,
	#superclass : #TestCase,
	#category : #'GeoCheck-Tests'
}

{ #category : #tests }
GeoCheckPositionTest >> testAngularDistance [
	| position1 position2 |
	position1 := 0 deg @ 0 deg.
	position2 := 0 deg @ 90 deg.
	self assert: (position1 angularDistanceTo: position2) closeTo: 90 deg .
]
