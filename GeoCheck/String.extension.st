Extension { #name : #String }

{ #category : #'*GeoCheck' }
String >> asDegreeAngle [
	^ GeoCheckAngle degreeAngle: self asNumber
]

{ #category : #'*GeoCheck' }
String >> asGeoCheckPosition [
	| angles |
	angles := self splitOn: '@'.
	^ (angles at: 1) deg @ (angles at: 2) deg
]

{ #category : #'*GeoCheck' }
String >> deg [
	^ ((self trim withoutSuffix: 'deg') trim) asDegreeAngle 
]
