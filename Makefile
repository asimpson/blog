build: generate

RELEASE = $(shell curl -sL "https://api.github.com/repos/asimpson/cycle/releases/latest" | grep "browser_download_url.*linux" | cut -d : -f 2,3)

cycle:
	@echo "Downloading cycle..."

	curl -sL "https://github.com/asimpson/cycle/releases/download/v0.3.0/cycle-linux" -o cycle
	chmod +x cycle

openring.mustache:
	./bin/openring \
	-s https://drewdevault.com/feed.xml \
	-s https://endler.dev/rss.xml \
	-s https://inessential.com/xml/rss.xml \
	-s https://www.bryanbraun.com/rss.xml \
	-s https://macwright.com/rss.xml \
	< openring.html \
	> ./templates/partials/openring.mustache

generate: site.css openring.mustache
	@echo "Building site..."
	PATH="`pwd`/bin:$$PATH" ./cycle
.PHONY: generate

clean:
	@echo "Cleaning..."
	rm site.css
	rm -rf site/
.PHONY: clean

site.css: tachyons.css custom.css
	@echo "Building css..."
	cat tachyons.css >> site.css
	cat custom.css >> site.css

date:
	@echo "Copy printed date..."
	date "+%Y-%m-%dT%H:%M:%S%z"
.PHONY: date
