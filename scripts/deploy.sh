#!/bin/bash

versoes=$(grep -oP '(?<=^[0-9]{4}\/[0-9]{2}\/[0-9]{2}, v)(4.3.*)' nxfilter.txt)

for versao in ${versoes}; do
	docker build --build-arg "NXFILTER_VERSION=${versao}" -t emanuelflp/nxfilter:${versao} .
	docker push emanuelflp/nxfilter:${versao}
done
