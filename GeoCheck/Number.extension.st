Extension { #name : #Number }

{ #category : #'*GeoCheck' }
Number >> deg [
	^ GeoCheckAngle degreeAngle: self
]

{ #category : #'*GeoCheck' }
Number >> rad [
	^ GeoCheckAngle radianAngle: self
]
