#!/bin/bash
set -ex

cat << EOF > index.htm
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<title>LMHD Labs</title>
<link rel="icon" href="https://lmhd.me/images/avatar.jpg">

<style>
.project img {
	width: 256px;
}

.card {
	display: inline-block;
	vertical-align: top;
}

.jumbotron {
	background: #cc0066;
	color: white;
}
</style>

<div class="jumbotron">
  <h1 class="display-4">LMHD Labs</h1>
</div>

<div class="container">

EOF

for d in */ ; do
	echo $d

	if [ -f $d/commit.txt ]; then
		cat $d/index.htm.tmpl | sed "s#REPLACE_COMMIT#$(cat $d/commit.txt)#" > $d/index.htm
	fi

	for s in ${d}screenshot* ; do
		if [ -f $s ]; then
			echo $s

			cat << EOF >> index.htm
<div class="card" style="width: 18rem;">
	<a href="${d}"><img src="/${s}" class="card-img-top"></a>
	<div class="card-body">
		<h5 class="card-title"><a href="${d}">${d}</a></h5>
	</div>
</div>
EOF
		fi

	done
done

cat << EOF >> index.htm
</div>
EOF
