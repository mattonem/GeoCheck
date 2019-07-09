"
A PPGeoCheckParser2ModelTest is a test class for testing the behavior of PPGeoCheckParser2Model
"
Class {
	#name : #PPGeoCheckParser2ModelTest,
	#superclass : #TestCase,
	#category : #'GeoCheck-Tests'
}

{ #category : #tests }
PPGeoCheckParser2ModelTest >> testSimpleCase [
	| model |
	model := PPGeoCheckParser2Model
		parse:
			'{"latitude": "52.986375", "user_id": 12, "name": "Christina McArdle", "longitude": "-6.043701"}'.
	self assert: (model at: 1) userId equals: 12.
	self
		assert: (model at: 1) geoPosition
		equals:
			{'52.986375' asDegreeAngle.
			'-6.043701' asDegreeAngle}
]
