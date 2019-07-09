Class {
	#name : #PPGeoCheckParser2Model,
	#superclass : #PPGeoCheckParser,
	#category : #GeoCheck
}

{ #category : #grammar }
PPGeoCheckParser2Model >> entry [
	^ super entry
		==> [ :anEntry | 
			| model |
			model := GeoCheckUserModel new.
			anEntry
				do: [ :ass | model perform: (ass key , ':') asSymbol with: ass value ].
			model ]
]
