Class {
	#name : #GeoCheckAngle,
	#superclass : #Object,
	#instVars : [
		'degree'
	],
	#category : #GeoCheck
}

{ #category : #instantiation }
GeoCheckAngle class >> degreeAngle: aNumber [
	^ self new
		degree: aNumber;
		yourself
]

{ #category : #'instance creation' }
GeoCheckAngle class >> radianAngle: aNumber [
	^ self new
		rad: aNumber;
		yourself
]

{ #category : #computing }
GeoCheckAngle >> - aGeoCheckAngle [ 
	^ (self rad - aGeoCheckAngle rad) rad
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
		latitude: self;
		longitude: aGeoCheckAngle;
		yourself
]

{ #category : #computing }
GeoCheckAngle >> abs [
	^ self rad  abs
]

{ #category : #comparing }
GeoCheckAngle >> closeTo: anObject [
	(anObject isKindOf: GeoCheckAngle)
		ifTrue: [ ^ self degree closeTo: anObject degree ].
	^ false
]

{ #category : #computing }
GeoCheckAngle >> cosine [
	^ self rad cos
]

{ #category : #comparing }
GeoCheckAngle >> degree [
	^ degree
]

{ #category : #comparing }
GeoCheckAngle >> degree: aNumber [ 
	degree := aNumber
]

{ #category : #comparing }
GeoCheckAngle >> hash [
	^ self class hash bitXor: self degree hash
]

{ #category : #comparing }
GeoCheckAngle >> printOn: aStream [
	degree printOn: aStream.
	aStream << '°'
]

{ #category : #comparing }
GeoCheckAngle >> rad [
	^ degree / self radianDegreeRation
]

{ #category : #accessing }
GeoCheckAngle >> rad: aNumber [ 
	degree := aNumber * self radianDegreeRation
]

{ #category : #comparing }
GeoCheckAngle >> radianDegreeRation [
	^ 180 / Float pi
]

{ #category : #computing }
GeoCheckAngle >> sine [
	^ self rad sin
]

{ #category : #computing }
GeoCheckAngle >> sinus [
	^ self rad sin
]
