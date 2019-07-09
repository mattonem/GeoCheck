Class {
	#name : #GeoCheckAngle,
	#superclass : #Object,
	#instVars : [
		'value'
	],
	#category : #GeoCheck
}

{ #category : #instantiation }
GeoCheckAngle class >> degreeAngle: aNumber [
	^ self new
		value: aNumber;
		yourself
]

{ #category : #comparing }
GeoCheckAngle >> = anObject [
	(anObject isKindOf: GeoCheckAngle)
		ifTrue: [ ^ self degree = anObject degree ].
	^ false
]

{ #category : #conversion }
GeoCheckAngle >> @ aGeoCheckAngle [
	^ GeoCheckPosition new
		longitude: self;
		latitude: aGeoCheckAngle;
		yourself
]

{ #category : #comparing }
GeoCheckAngle >> degree [
	^ value
]

{ #category : #comparing }
GeoCheckAngle >> hash [
	^ self class hash bitXor: self degree hash
]

{ #category : #comparing }
GeoCheckAngle >> printOn: aStream [
	value printOn: aStream.
	aStream << '°'
]

{ #category : #comparing }
GeoCheckAngle >> rad [
	^ value / self radianDegreeRation
]

{ #category : #comparing }
GeoCheckAngle >> radianDegreeRation [
	^ 180 / Float pi
]

{ #category : #comparing }
GeoCheckAngle >> value: aNumber [ 
	value := aNumber
]
