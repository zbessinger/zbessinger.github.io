.DEFAULT_GOAL := local

local: clean
	bundle exec jekyll build --config _config.yml
	bundle exec jekyll serve --watch --incremental

clean:
	rm -r _site/ || true
