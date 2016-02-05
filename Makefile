DOC=example-slides

html:
	mkdir -p images
	cp assets/* images/
	asciidoctor -r asciidoctor-diagram -T asciidoctor-backends/slim -a data-uri -a linkcss! $(DOC).adoc

pdf: html
	docker run --rm -v `pwd`:/pwd -v `pwd`:/home astefanutti/decktape /home/$(DOC).html /pwd/$(DOC).pdf

clean:
	rm -rf *.html *.pdf images/
