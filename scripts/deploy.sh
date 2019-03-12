#!/bin/bash

curl --output nxfilter.txt "http://www.nxfilter.org/changelog/nxfilter.txt"

versoes=$(grep -oP '(?<=^[0-9]{4}\/[0-9]{2}\/[0-9]{2}, v)(4.3.*)' nxfilter.txt | sort -n)

for versao in ${versoes}; do
	echo "${versao}"
	docker build --build-arg "NXFILTER_VERSION=${versao}" -t emanuelflp/nxfilter:${versao} .
	docker push emanuelflp/nxfilter:${versao}
done
