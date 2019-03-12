#!/bin/bash

lastRelease=$(cat lastRelease.txt)

curl --output nxfilter.txt "http://www.nxfilter.org/changelog/nxfilter.txt"

versao=$(grep -oP '(?<=^[0-9]{4}\/[0-9]{2}\/[0-9]{2}, v)(.*)' nxfilter.txt | head -n1)

if [[ "$versao" != "$lastRelease" ]]; then
	echo "${versao}"
	docker build --build-arg "NXFILTER_VERSION=${versao}" -t emanuelflp/nxfilter:${versao} .
	docker push emanuelflp/nxfilter:${versao}
	echo ${versao} > lastRelease.txt
fi
