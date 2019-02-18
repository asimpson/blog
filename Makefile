build: site.css generate

RELEASE = $(shell curl -sL "https://api.github.com/repos/asimpson/cycle/releases/latest" | grep "browser_download_url.*linux" | cut -d : -f 2,3)

cycle:
	@echo "Downloading cycle..."

	curl -sL $(RELEASE) -o cycle
	chmod +x cycle

generate:
	@echo "Building site..."
	./cycle
.PHONY: generate

clean:
	@echo "Cleaning..."
	rm site.css
	rm -rf site/
.PHONY: clean

site.css: tachyons.css custom.css
	@echo "Building css..."
	cat tachyons.css > site.css
	cat custom.css >> site.css
