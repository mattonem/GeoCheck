Class {
	#name : #BaselineOfGeoCheck,
	#superclass : #BaselineOf,
	#category : #BaselineOfGeoCheck
}

{ #category : #baselines }
BaselineOfGeoCheck >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ spec
				baseline: 'PetitParser'
				with: [ spec
						repository: 'github://moosetechnology/PetitParser/src';
						loads: #default ].
			spec
				package: 'GeoCheck' with: [ spec requires: 'PetitParser' ];
				yourself ]
]
