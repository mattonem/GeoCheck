"
This parser will properly parse the file provided. It will output proper models that we wille use later. 
"
Class {
	#name : #PPGeoCheckParser2Model,
	#superclass : #PPGeoCheckParser,
	#category : #GeoCheck
}

{ #category : #grammar }
PPGeoCheckParser2Model >> entry [
"Every time the we parse and entry, we create a GeoCheckUserModel"
	^ super entry
		==> [ :anEntry | 
			| model |
			model := GeoCheckUserModel new.
			anEntry
				do: [ :ass | model perform: (ass key , ':') asSymbol with: ass value ].
			model ]
]
