Class {
	#name : #PPGeoCheckParser,
	#superclass : #PPCompositeParser,
	#instVars : [
		'string',
		'charNormal',
		'keyValue',
		'entry',
		'list',
		'integer',
		'start'
	],
	#category : #GeoCheck
}

{ #category : #grammar }
PPGeoCheckParser >> charNormal [
	^ ($" asParser not) , (#any asParser)
]

{ #category : #grammar }
PPGeoCheckParser >> entry [
	^ (${ asParser
		, (keyValue separatedBy: $, asParser) withoutSeparators trim
		, $} asParser) trim ==> [ :parsedEntry | parsedEntry at: 2 ]
]

{ #category : #grammar }
PPGeoCheckParser >> integer [
 ^ (#digit asParser plus flatten trim) ==> [ :token | token asNumber ]
]

{ #category : #grammar }
PPGeoCheckParser >> keyValue [
	^ (string , $: asParser trim , (string / integer)) trim
		==> [ :parsedKeyValue | (parsedKeyValue at: 1) -> (parsedKeyValue at: 3) ]
]

{ #category : #grammar }
PPGeoCheckParser >> list [
	^ entry star
]

{ #category : #grammar }
PPGeoCheckParser >> start [
	^ list end
]

{ #category : #grammar }
PPGeoCheckParser >> string [
	^ $" asParser, charNormal star flatten , $" asParser ==> [ :parsedString | parsedString at: 2]
		
]
