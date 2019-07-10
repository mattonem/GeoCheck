Extension { #name : #Number }

{ #category : #'*GeoCheck' }
Number >> deg [
	"Very convinient method that return an Angle from a Number.
	Making possible to write: 42 deg"
	^ GeoCheckAngle degreeAngle: self
]

{ #category : #'*GeoCheck' }
Number >> rad [
	"Very convinient method that return an Angle from a Number.
	Making possible to write: 42 rad"
	^ GeoCheckAngle radianAngle: self
]
