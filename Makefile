



index.html: sanadamaru_karuta.rb
	bundle exec ruby sanadamaru_karuta.rb > index.html



push:
	git push origin master
	git checkout gh-pages
	git merge master
	git push oriign gh-pages
	git checkout master
