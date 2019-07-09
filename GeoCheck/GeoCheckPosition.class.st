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
GeoCheckPosition >> absoluteLatitudeDeltaTo: aGeoCheckPosition [ 
	^(latitude - aGeoCheckPosition latitude) abs 
]

{ #category : #computing }
GeoCheckPosition >> absoluteLongitudeDeltaTo: aGeoCheckPosition [ 
	^ (longitude - aGeoCheckPosition longitude) abs 
]

{ #category : #computing }
GeoCheckPosition >> angularDistanceTo: anOtherPosition [
	| dLat dLong sin2dLat coscossin2dLong |
	dLat := self absoluteLatitudeDeltaTo: anOtherPosition.
	dLong := self absoluteLongitudeDeltaTo: anOtherPosition.
	sin2dLat := (dLat / 2) sine ** 2.
	coscossin2dLong := longitude sine * anOtherPosition longitude sine
		* ((dLong / 2) sine ** 2).
	^ 2 * ((sin2dLat + coscossin2dLong) sqrt arcSin) 
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
