templatePost=./_posts/yyyy-mm-dd-template-post.md
newPost=./_posts/$(date +%F-${RANDOM}.md)

if [ "$1" != "" ]; then
	newPost=./_posts/$(date +%F-${1}.md)
fi

echo $newPost
cp -n ${templatePost} ${newPost}
${EDITOR:-${VISUAL:-vi}} ${newPost}
