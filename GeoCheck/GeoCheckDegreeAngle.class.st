Class {
	#name : #GeoCheckDegreeAngle,
	#superclass : #GeoCheckAngle,
	#instVars : [
		'value'
	],
	#category : #GeoCheck
}

{ #category : #instantiation }
GeoCheckDegreeAngle class >> with: aNumber [ 
	^self new value: aNumber
]

{ #category : #accessing }
GeoCheckDegreeAngle >> degree [
	^ value
]

{ #category : #accessing }
GeoCheckDegreeAngle >> printOn:aStream [
	value printOn: aStream.
	aStream << '°'
]

{ #category : #accessing }
GeoCheckDegreeAngle >> value: aNumber [ 
	value := aNumber
]
