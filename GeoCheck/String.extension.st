Extension { #name : #String }

{ #category : #'*GeoCheck' }
String >> asDegreeAngle [
	^ GeoCheckAngle degreeAngle: self asNumber
]
