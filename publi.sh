#!/bin/bash

echo "<h1>LMHD Labs</h1>" > index.htm

for d in */ ; do
	echo $d

	cat << EOF >> index.htm
<h2><a href="${d}">${d}</a></h1>
EOF

	for s in ${d}screenshot* ; do
		if [ -f $s ]; then
			echo $s

			cat << EOF >> index.htm
<img src="/${s}" />
EOF
		fi

	done
done
