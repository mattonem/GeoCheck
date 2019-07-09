Class {
	#name : #GeoCheckPosition,
	#superclass : #Object,
	#instVars : [
		'longitude',
		'latitude'
	],
	#category : #GeoCheck
}

{ #category : #accessing }
GeoCheckPosition >> = anObject [
	(anObject isKindOf: GeoCheckPosition)
		ifTrue: [ ^ longitude = anObject longitude
				and: [ latitude = anObject latitude ] ].
	^ false
]

{ #category : #computing }
GeoCheckPosition >> absoluteLongitudeDeltaTo: aGeoCheckPosition [ 
	^ (longitude - aGeoCheckPosition longitude) abs 
]

{ #category : #computing }
GeoCheckPosition >> angularDistanceTo: anOtherPosition [
	^ ((self latitude sine * anOtherPosition latitude sine
		+ (self longitude cosine * anOtherPosition longitude cosine))
		* (self absoluteLongitudeDeltaTo: anOtherPosition)) arcCos rad
]

{ #category : #accessing }
GeoCheckPosition >> hash [
	^ longitude hash bitXor: latitude hash
]

{ #category : #accessing }
GeoCheckPosition >> latitude [
	^ latitude
]

{ #category : #accessing }
GeoCheckPosition >> latitude: aGeoCheckAngle [ 
	latitude := aGeoCheckAngle
]

{ #category : #accessing }
GeoCheckPosition >> longitude [
	^ longitude
]

{ #category : #accessing }
GeoCheckPosition >> longitude: aGeoCheckAngle [ 
	longitude := aGeoCheckAngle 
]

{ #category : #accessing }
GeoCheckPosition >> printOn: aStream [
	longitude printOn: aStream.
	aStream << '  '.
	latitude printOn: aStream.
]
