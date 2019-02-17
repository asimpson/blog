build: site.css cycle

cycle:
	@echo "Building site..."
	./cycle
.PHONY: cycle

clean:
	@echo "Cleaning..."
	rm -f site.css
.PHONY: clean

site.css: clean
	@echo "Building css..."
	cat tachyons.css > site.css
	cat custom.css >> site.css
