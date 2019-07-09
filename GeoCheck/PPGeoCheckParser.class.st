Class {
	#name : #PPGeoCheckParser,
	#superclass : #PPCompositeParser,
	#instVars : [
		'string',
		'charNormal',
		'keyValue',
		'entry',
		'list',
		'integer'
	],
	#category : #GeoCheck
}

{ #category : #grammar }
PPGeoCheckParser >> charNormal [
	^ ($" asParser not) , (#any asParser)
]

{ #category : #grammar }
PPGeoCheckParser >> entry [
	^ (${ asParser , (keyValue separatedBy: $, asParser) trim
		, $} asParser) trim
]

{ #category : #grammar }
PPGeoCheckParser >> integer [
 ^ (#digit asParser plus flatten trim) ==> [ :token | token asNumber ]
]

{ #category : #grammar }
PPGeoCheckParser >> keyValue [
	^ (string , $: asParser , (string / integer)) trim
]

{ #category : #grammar }
PPGeoCheckParser >> list [
	^ entry star
]

{ #category : #accessing }
PPGeoCheckParser >> start [
	^ self shouldBeImplemented
]

{ #category : #grammar }
PPGeoCheckParser >> string [
 ^ ($" asParser, charNormal star flatten , $" asParser) trim
]
