#!/bin/bash

ORACLIENT=oracle12.2
IMAGENAME=supermamon/oracle-node
LASTTAG=latest

build() {
	pushd $1 &>/dev/null
	#echo "inside $1"

	tag=$1
	tag="${tag/.\/}"
        tag="${tag/\/}"
	docker build -t $IMAGENAME:$tag .
	docker push $IMAGENAME:$tag

	newtag=$(echo $tag | sed 's/\.[^\.]*$//')
	docker rmi -f $IMAGENAME:$newtag
	docker tag $IMAGENAME:$tag $IMAGENAME:$newtag
	docker push $IMAGENAME:$newtag


	newtag=$(echo $newtag | sed 's/\.[^\.]*$//')
	docker rmi -f $IMAGENAME:$newtag
	docker tag $IMAGENAME:$tag $IMAGENAME:$newtag
	docker push $IMAGENAME:$newtag

	LASTTAG=$tag

	popd &>/dev/null
}


for dir in ./*/
do
	if [ ! -e $dir/Dockerfile ]; then
		continue
	fi
	#echo $dir
	mv $ORACLIENT $dir
	build $dir

	mv $dir/$ORACLIENT ./
done
docker tag $IMAGENAME:$LASTTAG $IMAGENAME:latest
docker push $IMAGENAME:latest
