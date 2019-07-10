Class {
	#name : #GeoCheckLineHandler,
	#superclass : #CommandLineHandler,
	#instVars : [
		'file',
		'target',
		'radius'
	],
	#category : #GeoCheck
}

{ #category : #accessing }
GeoCheckLineHandler class >> commandName [
	" Overwrite this method to provide a short name for this command handler.
	You may pass the commandName as first argument to the image to select this handler"
	^ 'geoCheck'
]

{ #category : #activation }
GeoCheckLineHandler >> activate [
	^ self
		log:
			((PPGeoCheckParser2Model
				parse: self getFileName asFileReference readStream)
				select:
					[ :user | (user geoPosition earthDistanceTo: self getTarget) < self getRadius ])
]

{ #category : #'as yet unclassified' }
GeoCheckLineHandler >> getFileName [
	file ifNil: [ 
		file := (self hasOption: 'file')
			ifTrue: [ self optionAt: 'file' ]
			ifFalse: [ './customers.txt' ] ]
]

{ #category : #'as yet unclassified' }
GeoCheckLineHandler >> getRadius [
	radius ifNil: [ 
		radius := (self hasOption: 'radius')
			ifTrue: [ self optionAt: 'radius' ]
			ifFalse: [ '100' ] ]
]

{ #category : #'as yet unclassified' }
GeoCheckLineHandler >> getTarget [
	target ifNil: [ 
		target := (self hasOption: 'target')
			ifTrue: [ self optionAt: 'target' ]
			ifFalse: [ '53.339428 deg @ -6.257664 deg' ] ]
]
