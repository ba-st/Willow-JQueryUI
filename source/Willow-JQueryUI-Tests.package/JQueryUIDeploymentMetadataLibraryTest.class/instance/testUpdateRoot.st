tests
testUpdateRoot

	| html |

	html := WAHtmlCanvas builder
		fullDocument: true;
		rootBlock: [ :root | JQueryUIDeploymentMetadataLibrary default updateRoot: root ];
		render: [ :canvas |  ].

	self
		assert: html
		equals:
			'<html><head><title></title><link rel="stylesheet" type="text/css" href="/files/jquery-ui-1.11.4/jquery-ui.min.css"/><script type="text/javascript" src="/files/jquery-ui-1.11.4/jquery-ui.min.js"></script></head><body onload="onLoad()"><script type="text/javascript">function onLoad(){};</script></body></html>'