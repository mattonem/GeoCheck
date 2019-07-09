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
	^ Array with: latitude with: longitude 
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
GeoCheckUserModel >> userId [
	^ userId
]

{ #category : #accessing }
GeoCheckUserModel >> user_id [
	self shouldBeImplemented.
]
