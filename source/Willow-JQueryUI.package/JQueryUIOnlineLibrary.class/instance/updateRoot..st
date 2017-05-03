Updating
updateRoot: aRoot

	aRoot stylesheet
		url: ('https://code.jquery.com/ui/<1s>/jquery-ui.min.js' expandMacrosWith: self version);
		anonymousSubResourceIntegrity: 'sha256-xNjb53/rY+WmG+4L6tTl9m6PpqknWZvRt0rO1SRnJzw='.
	aRoot javascript
		url:
			('https://code.jquery.com/ui/<1s>/themes/pepper-grinder/jquery-ui.css'
				expandMacrosWith: self version);
		anonymousSubResourceIntegrity: 'sha256-xNjb53/rY+WmG+4L6tTl9m6PpqknWZvRt0rO1SRnJzw='