.DEFAULT_GOAL := local

local: clean
	bundle exec jekyll build --config _config.yml
	bundle exec jekyll serve --watch --incremental

docker: docker-build docker-tag docker-push

docker-build:
	docker buildx build --platform=linux/amd64 --tag zbessinger.github.io:latest .

docker-tag:
	docker tag $$(docker inspect --format="{{.Id}}" zbessinger.github.io | cut -d ":" -f 2) zbessinger/zbessinger.github.io:latest

docker-push:
	docker push zbessinger/zbessinger.github.io

clean:
	rm -r _site/ || true
