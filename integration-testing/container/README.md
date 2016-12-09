# Image for JBoss AS 6.1.0.Final for BED

## Remarks 
   On linux, docker run on the ip of the machine.
   On windows, it runs in a vm images (ip is 192.168.99.xxx   xxx = 100 in most of the cases)
  

## Prerequisites

You need to install CNTLM in order to have a local proxy that can be used by the containers. CNTLM should be configured on port 3128 (default). 

## How to build

```
docker build --no-cache --build-arg PROXY_HOST=<your_local_ip> -t nippin/bedop <folder_containing_the_docker_file>
```

## How to run

```
docker run -d -v <your_local_folder_for_deploy>/bedop:/usr/mycarenet/JBoss/instance/server/default/deploy-from-out -p 8009:8009 -p 8080:8080 -p 8787:8787 -p 9990:9990 nippin/bedop
```

## How to access

- url: http://localhost:8080/admin-console
- user: admin
- password: admin

## How to deploy

Just push artifacts (EARs, ...) inside \<your_local_folder_for_deploy\>\bedop and it will be automatically into account by JBoss.

## How to remote debug

Remote debugging is enabled on port 8787.

## Known issues


## Notes

