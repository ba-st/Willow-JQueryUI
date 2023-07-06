"
I'm a WALibrary serving the files from the official CDN.
"
Class {
	#name : #JQueryUIOnlineLibrary,
	#superclass : #WAOnlineLibrary,
	#category : #'Willow-JQueryUI-Libraries'
}

{ #category : #Updating }
JQueryUIOnlineLibrary >> updateRoot: aRoot [

	aRoot javascript url:
		( 'https://code.jquery.com/ui/<1s>/jquery-ui.min.js' expandMacrosWith: self version ).
	aRoot stylesheet url:
		( 'https://code.jquery.com/ui/<1s>/themes/pepper-grinder/jquery-ui.css' expandMacrosWith:
			  self version )
]

{ #category : #Accessing }
JQueryUIOnlineLibrary >> version [

	^'1.13.2'
]
