"
A PPGeoCheckParserTest is a test class for testing the behavior of PPGeoCheckParser
"
Class {
	#name : #PPGeoCheckParserTest,
	#superclass : #TestCase,
	#category : #'GeoCheck-Tests'
}

{ #category : #tests }
PPGeoCheckParserTest >> testSimpleCase [
	| parsed |
	parsed := PPGeoCheckParser
		parse:
			'{"key1": "value1", "key2": 111}'.
	self assert: parsed size equals: 1.
	self assert: (parsed at: 1) size equals: 2.
	self assert: ((parsed at: 1) at: 1) value  equals: 'value1'.
	self assert: ((parsed at: 1) at: 2) value  equals: 111.
]
