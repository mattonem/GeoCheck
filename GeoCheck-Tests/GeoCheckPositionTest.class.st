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
	self assert: (position1 angularDistanceTo: position2) closeTo: 90 deg.
	position1 := 20 deg @ 20 deg.
	position2 := 20 deg @ 20 deg.
	self assert: (position1 angularDistanceTo: position2) closeTo: 0 deg.
	position1 := 20 deg @ 20 deg.
	position2 := 20 deg @ 110 deg.
	self assert: (position1 angularDistanceTo: position2) closeTo: 83.2822 deg
]

{ #category : #tests }
GeoCheckPositionTest >> testEarthDistance [
	| paris newYork |
	paris := 48.866667 deg @ 2.333333 deg.
	newYork := 40.712784 deg @ -74.005941 deg.
	self
		assert: ((paris earthDistanceTo: newYork) between: 5832 and: 5837)
]
