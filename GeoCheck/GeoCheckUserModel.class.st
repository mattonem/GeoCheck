Class {
	#name : #GeoCheckUserModel,
	#superclass : #Object,
	#instVars : [
		'latitude',
		'userId',
		'name',
		'longitude'
	],
	#category : #GeoCheck
}

{ #category : #accessing }
GeoCheckUserModel >> geoPosition [
	^  latitude @ longitude 
]

{ #category : #accessing }
GeoCheckUserModel >> latitude: anObject [ 
	latitude := anObject asDegreeAngle
]

{ #category : #accessing }
GeoCheckUserModel >> longitude: anObject [
	longitude := anObject asDegreeAngle
]

{ #category : #accessing }
GeoCheckUserModel >> name: aString [ 
	name := aString
]

{ #category : #accessing }
GeoCheckUserModel >> printOn: aStream [
	aStream << 'user_id: '.
	userId printOn: aStream.
	aStream << Character tab <<'name:  '.
	name printOn: aStream.
	aStream << Character tab <<'position:  '.
	self geoPosition printOn: aStream.
]

{ #category : #accessing }
GeoCheckUserModel >> userId [
	^ userId
]

{ #category : #accessing }
GeoCheckUserModel >> user_id [
	self shouldBeImplemented.
]

{ #category : #accessing }
GeoCheckUserModel >> user_id: anInteger [ 
	userId := anInteger 
]
