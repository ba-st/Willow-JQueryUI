tests-Processing
testUpdateRoot

	| html |

	html := WAHtmlCanvas builder
		fullDocument: true;
		rootBlock: [ :root | JQueryUIComponentSupplier online updateRoot: root ];
		render: [ :canvas |  ].

	self
		assert: html
		equals:
			'<!DOCTYPE html><html><head><title></title><meta name="viewport" content="width=device-width, initial-scale=1.0"/><link rel="stylesheet" type="text/css" href="https://code.jquery.com/ui/1.11.4/jquery-ui.min.js" integrity="sha256-xNjb53/rY+WmG+4L6tTl9m6PpqknWZvRt0rO1SRnJzw=" crossorigin="anonymous"/><script type="text/javascript" src="https://code.jquery.com/ui/1.11.4/themes/pepper-grinder/jquery-ui.css" integrity="sha256-xNjb53/rY+WmG+4L6tTl9m6PpqknWZvRt0rO1SRnJzw=" crossorigin="anonymous"></script></head><body onload="onLoad()"><script type="text/javascript">function onLoad(){};</script></body></html>'