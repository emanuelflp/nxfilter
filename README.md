[![](https://images.microbadger.com/badges/image/emanuelflp/nxfilter.svg)](https://microbadger.com/images/emanuelflp/nxfilter "Get your own image badge on microbadger.com")  [![](https://images.microbadger.com/badges/version/emanuelflp/nxfilter.svg)](https://microbadger.com/images/emanuelflp/nxfilter "Get your own version badge on microbadger.com")


![nothing](http://www.nxfilter.org/p2/wp-content/uploads/2014/07/rb_logo41.png)

[NxFilter](http://www.nxfilter.org/) - An easy to use DNS server with configurable filters and user controls.

This image is fully maked by me.

### Supported Tags

[`latest, 8.3.3.4`](https://github.com/emanuelflp/nxfilter/)

### Usage

**For a single persistent container:**
```
docker run -it \
  --name nxfilter \
  -p 80:80 -p 443:443\
  -p 53:53/udp \
  emanuelflp/nxfilter:latest
```
```-it``` starts the container in Interactive mode with a TTY. ```-p``` forwards a port into the container, other ports are needed to utilize all features of nxfilter. 53 UDP is to accept DNS queries coming in, 80 is for the WebUI. The interactive console can be sent to the background with CTRL-P + CTRL-Q.



**For a transient container with a persistent data volumes**
```
docker run -dt \
  --name nxfilter \
  -v nxfilter-conf:/nxfilter/conf \
  -v nxfilter-log:/nxfilter/log \
  -v nxfilter-db:/nxfilter/db \
  -p 80:80 -p 443:443 -p 53:53/udp \
  -p 19002-19004:19002-19004 \
  emanuelflp/nxfilter:latest
```

This will run the container in the background like a service, with a persistent data volume mounted for each folder that nxfilter modifies data in. Ports 80 and 53 are forwarded to the container for accessing NxFilter admin interface and accepting DNS queries. You may add ```--rm``` so the container will be removed after stopping. All changes will be saved in volumes.
### To Do
- Fully test running in an automated encironment like Shipyard or TravisCI

### Done
- Create Docker file for both images. Shouldn't be too hard.
- Set up automated builds of the images.
- Finish testing automated builds and webhooks to completely automate the process.
