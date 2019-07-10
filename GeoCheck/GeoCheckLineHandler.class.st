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
	^ 'geoCheck'
]

{ #category : #activation }
GeoCheckLineHandler >> activate [
	"This is equivalent to the main method when excecuted from command line"
	| users |
	users := (PPGeoCheckParser2Model
		parse: self getFileName asFileReference contents)
		select:
			[ :user | (user geoPosition earthDistanceTo: self getTarget) < self getRadius ].
	self stdout
		<< '======================================';
		lf;
		<< 'Client ids within ';
		print: radius;
		<< ' km of location ';
		print: target;
		<< ' are:';
		lf.
	users
		do: [ :aUser | 
			self stdout
				print: aUser userId;
				<< ' ' ].
	self stdout
		lf;
		<< '======================================';
		lf.
	^ Smalltalk snapshot: false andQuit: true
]

{ #category : #accessing }
GeoCheckLineHandler >> getFileName [
	file
		ifNil: [ file := (self hasOption: 'file')
				ifTrue: [ self optionAt: 'file' ]
				ifFalse: [ './customers.txt' ] ].
	^ file
]

{ #category : #accessing }
GeoCheckLineHandler >> getRadius [
	radius
		ifNil: [ radius := (self hasOption: 'radius')
				ifTrue: [ (self optionAt: 'radius') asInteger ]
				ifFalse: [ 100 ] ].
	^ radius
]

{ #category : #accessing }
GeoCheckLineHandler >> getTarget [
	target
		ifNil: [ target := (self hasOption: 'target')
				ifTrue: [ (self optionAt: 'target') asGeoCheckPosition ]
				ifFalse: [ '53.339428 deg @ -6.257664 deg' asGeoCheckPosition ] ].
	^ target
]
