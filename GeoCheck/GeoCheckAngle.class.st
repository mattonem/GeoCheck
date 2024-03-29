Class {
	#name : #GeoCheckAngle,
	#superclass : #Object,
	#instVars : [
		'radian'
	],
	#category : #GeoCheck
}

{ #category : #'instance creation' }
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
GeoCheckAngle >> * anInteger [
	^ (self rad * anInteger) rad
]

{ #category : #computing }
GeoCheckAngle >> - aGeoCheckAngle [ 
	^ (self rad - aGeoCheckAngle rad) rad
]

{ #category : #computing }
GeoCheckAngle >> / anInteger [ 
	^(self rad / 2 ) rad
]

{ #category : #comparing }
GeoCheckAngle >> = anObject [
	^ (anObject isGeoCheckAngle)
		and: [ self degree = anObject degree ].
	
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
	^ self rad abs rad
]

{ #category : #comparing }
GeoCheckAngle >> closeTo: anObject [
	^ anObject isGeoCheckAngle and: [ self degree closeTo: anObject degree ].
	
]

{ #category : #computing }
GeoCheckAngle >> cosine [
	^ self rad cos
]

{ #category : #comparing }
GeoCheckAngle >> degree [
	^ radian * self radianDegreeRation  
]

{ #category : #comparing }
GeoCheckAngle >> degree: aNumber [ 
	radian := aNumber / self radianDegreeRation  
]

{ #category : #comparing }
GeoCheckAngle >> hash [
	^ self class hash bitXor: self degree hash
]

{ #category : #comparing }
GeoCheckAngle >> isGeoCheckAngle [ 
	^ true
]

{ #category : #comparing }
GeoCheckAngle >> printOn: aStream [
	self degree printOn: aStream.
	aStream << '°'
]

{ #category : #comparing }
GeoCheckAngle >> rad [
	^ radian
]

{ #category : #accessing }
GeoCheckAngle >> rad: aNumber [ 
	radian := aNumber
]

{ #category : #constants }
GeoCheckAngle >> radianDegreeRation [
	^ 180 / Float pi
]

{ #category : #computing }
GeoCheckAngle >> sine [
	^ self rad sin
]
