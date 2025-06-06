def --env yazi-cwd [...args] {
	let tmp = (mktemp -t "yazi-cwd.XXXXXX")

	yazi ...$args --cwd-file $tmp

	let cwd = (open $tmp)
	if $cwd != "" and $cwd != $env.PWD {
		cd $cwd
	}

	rm -fp $tmp
}

alias y = yazi-cwd
