Class {
	#name : #GeoCheckAngle,
	#superclass : #Object,
	#category : #GeoCheck
}

{ #category : #instantiation }
GeoCheckAngle class >> degreeAngle: aNumber [ 
	^GeoCheckDegreeAngle with: aNumber
]

{ #category : #comparing }
GeoCheckAngle >> = anObject [
	(anObject isKindOf: GeoCheckAngle)
		ifTrue: [ ^ self degree = anObject degree ].
	^ false
]

{ #category : #accessing }
GeoCheckAngle >> degree [
	self subclassResponsibility .
]

{ #category : #comparing }
GeoCheckAngle >> hash [
	^ self degree hash
]
