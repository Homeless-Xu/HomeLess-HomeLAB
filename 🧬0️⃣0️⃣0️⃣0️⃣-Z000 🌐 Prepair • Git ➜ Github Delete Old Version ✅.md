
```

🟢 Git • Del Old Version


🔶 why

	old file maybe have password.
	if you need keep all current file. and delete all old version.
	this is for you.


🔶 how 💯

	• create backup:        git checkout --orphan latest_branch
	• add file:             git add -A
	• commit:               git commit -am "del all old version"
	• delete old:           git branch -D master
	• rename backup:        git branch -m master
	• push:                 git push -f origin master

```

