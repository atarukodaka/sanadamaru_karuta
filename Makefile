



html: sanadamaru_karuta.rb
	bundle exec ruby sanadamaru_karuta.rb > index.html


add:
	git add  images

cmt:
	git commit -m add-photos

push:
	git push origin master
	git checkout gh-pages
	git merge master
	git push origin gh-pages
	git checkout master
