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
	^ (anObject isGeoCheckPosition)
		and: [ longitude = anObject longitude
				and: [ latitude = anObject latitude ] ].

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
	coscossin2dLong := latitude cosine * anOtherPosition latitude cosine
		* ((dLong / 2) sine ** 2).
	^ (2 * (sin2dLat + coscossin2dLong) sqrt arcSin )rad
]

{ #category : #computing }
GeoCheckPosition >> earthDistanceTo: aGeoCheckPosition [ 
	^ (self angularDistanceTo: aGeoCheckPosition) rad * self earthRadius
]

{ #category : #constants }
GeoCheckPosition >> earthRadius [
	^ 6371
]

{ #category : #accessing }
GeoCheckPosition >> hash [
	^ longitude hash bitXor: latitude hash
]

{ #category : #accessing }
GeoCheckPosition >> isGeoCheckPosition [
	^ true
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
