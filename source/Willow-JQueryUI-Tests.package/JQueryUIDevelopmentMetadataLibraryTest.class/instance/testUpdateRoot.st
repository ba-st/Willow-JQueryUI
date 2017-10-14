tests
testUpdateRoot

	| html |

	html := WAHtmlCanvas builder
		fullDocument: true;
		rootBlock: [ :root | JQueryUIDevelopmentMetadataLibrary default updateRoot: root ];
		render: [ :canvas |  ].

	self
		assert: html
		equals:
			'<html><head><title></title><link rel="stylesheet" type="text/css" href="/files/jquery-ui-1.12.1/jquery-ui.structure.css"/><link rel="stylesheet" type="text/css" href="/files/jquery-ui-1.12.1/jquery-ui.theme.css"/><script type="text/javascript" src="/files/jquery-ui-1.12.1/jquery-ui.js"></script></head><body onload="onLoad()"><script type="text/javascript">function onLoad(){};</script></body></html>'