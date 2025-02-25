"
A baseline for XML writer for Pharo [https://github.com/pharo-contributions/XML-XMLWriter](https://github.com/pharo-contributions/XML-XMLWriter)
"
Class {
	#name : #BaselineOfXMLWriter,
	#superclass : #BaselineOf,
	#category : #'BaselineOfXMLWriter-Base'
}

{ #category : #baselines }
BaselineOfXMLWriter >> baseline: spec [
	<baseline>
	
	spec 
		for: #common
		do: [ 
			spec blessing: #baseline.
			
			"Prerequisite Projects"			
			self orderPreservingDictionaryOn: spec.
								
			"Packages"
			spec 
				package: 'XML-Writer-Core' with: [ spec requires: #('OrderPreservingDictionary') ];
				package: 'XML-Writer-Tests' with: [ spec requires: #('XML-Writer-Core' 'OrderPreservingDictionary Tests') ].
						
			"Groups"
			spec
				group: 'Core' with: #('XML-Writer-Core');
				group: 'Tools' with: #('OrderPreservingDictionary Tools');  
				group: 'Tests' with: #('XML-Writer-Tests');
				group: 'CI' with: #('Tests');	
				group: 'all' with: #('Core' 'Tools' 'Tests');
				group: 'default' with: #('all') ].

	"load gemstone compatibility methods"
	spec
		for: #'gemstone'
		do: [
			spec
				package: 'XML-Writer-Core' with: [ spec includes: 'XML-Writer-GemstoneCompatibility' ];
				package: 'XML-Writer-GemstoneCompatibility' with: [ spec requires: 'XML-Writer-Core' ]]	
]

{ #category : #prerequisites }
BaselineOfXMLWriter >> orderPreservingDictionaryOn: spec [

	spec
		baseline: 'OrderPreservingDictionary'
      with: [ 
			spec
				loads: #('Core');
				repository: 'github://pharo-contributions/OrderPreservingDictionary:v1.6.x/src' ]. 
				
	spec 
		project: 'OrderPreservingDictionary Tests' copyFrom: 'OrderPreservingDictionary' with: [ spec loads: #('Tests') ];			
		project: 'OrderPreservingDictionary Tools' copyFrom: 'OrderPreservingDictionary' with: [ spec loads: #('Tools') ]
]
