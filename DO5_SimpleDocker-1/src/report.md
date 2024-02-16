### S21_SimpleDocker report

#### Part 1. Ready-made docker

##### Take the official docker image from nginx and download it using `docker pull`
![](pic/docker_pull.png)

##### Check for the docker image with `docker images`
![](pic/docker_images.png)

##### Run docker image with `docker run -d [image_id|repository]`

![](pic/docker_run.png)

##### Check that the image is running with `docker ps`
![](pic/docker_ps.png)

##### View container information with `docker inspect [container_id|container_name]`

![](pic/docker_inspect.png)

##### From the command output define and write in the report the container size, list of mapped ports and container ip
![](pic/docker_inspect_size.png)
![](pic/docker_inspect_ports_ipaddress.png)

##### Stop docker image with docker stop `[container_id|container_name]`

![](pic/docker_stop.png)

##### Check that the image has stopped with `docker ps`
![](pic/docker_ps_after_stop.png)

##### Run docker with ports 80 and 443 in container, mapped to the same ports on the local machine, with `run` command

![](pic/docker_mapped_80_443.png)

##### Check that the nginx start page is available in the browser at `localhost:80`

![](pic/localhost_80.png)

##### Restart docker container with `docker restart [container_id|container_name]`
##### Check in any way that the container is running

![](pic/docker_restart.png)

#### Part 2. Operations with container

##### Read the nginx.conf configuration file inside the docker container with the `exec` command

![](pic/docker_exec_read_conf.png)

##### Create a nginx.conf file on a local machine
![](pic/touch_nginx_conf.png)

##### Configure it on the /status path to return the nginx server status page
![](pic/nginx_conf.png)

##### Copy the created nginx.conf file inside the docker image using the `docker cp` command
![](pic/docker_cp_nginx_conf.png)

##### Restart nginx inside the docker image with `exec`

![](pic/docker_nginx_reload_after_cp.png)

##### Check that `localhost:80/status` returns the nginx server status page

![](pic/localhos_80_status.png)

##### Export the container to a container.tar file with the `export` command

![](pic/export_container.png)
![](pic/container_tar.png)

##### Stop the container
![](pic/part2_docker_stop.png)

##### Delete the image with `docker rmi [image_id|repository]` without removing the container first

![](pic/delete_nginx.png)

##### Delete stopped container

![](pic/remove_stopped_container.png)

##### Import the container back using the `import` command

![](pic/import_container_.png)
![](pic/docker_images_after_import.png)

##### Run the imported container
![](pic/docker_run_after_import.png)

##### Check that localhost:80/status returns the nginx server status page

![](pic/status_after_import.png)


### Part 3. Mini web server

#### Write a mini server in C and FastCgi that will return a simple page saying Hello World!

![](pic/mini_server_c.png)

#### Write your own nginx.conf that will proxy all requests from port 81 to 127.0.0.1:8080

![](pic/config_part3.png)

#### Run the written mini server via spawn-fcgi on port 8080

![](pic/docker_run_81_part3.png)

#### Copy file .conf
![](pic/docker_cp_conf_part3.png)

#### Install gcc and fcgi 
![](pic/docker_install_libfcgi_gcc_1.png)
![](pic/docker_install_libfcgi_gcc_2.png)

#### Compile and run spawn-fcgi
![](pic/docker_compile_run_spawn.png)

#### Restart
![](pic/docker_restart_part3.png)

#### Check that browser on localhost:81 returns the page you wrote 

![](pic/docker_check_part3.png)


#### Put the nginx.conf file under ./nginx/nginx.conf (you will need this later)

### Part 4. Your own docker

#### Write your own docker image that:

1) builds mini server sources on FastCgi from Part 3
2) runs it on port 8080
3) copies inside the image written ./nginx/nginx.conf
4) runs nginx

![](pic/part4_dockerfile.png)
![](pic/part4_sh.png)

#### Build the written Docker image via docker build, specifying the name and tag

![](pic/part4_docker_build.png)

#### Check image
![](pic/part4_images.png)

#### Run the built docker image by mapping port 81 to 80 on the local machine and mapping the ./nginx folder inside the container to the address where the nginx configuration files are located

![](pic/part4_run_80-81.png)
![](pic/part4_docker_ps.png)

#### Check that the page of the written mini server is available on localhost:80

![](pic/part4_curl_localhost.png)

#### Add proxying of /status page to return the nginx server status

![](pic/part4_status.png)

#### Restart docker image

![](pic/part4_restart.png)


#### Check that localhost:80/status now returns a page with nginx status

![](pic/part4_check_staus_page.png)


### Part 5. Dockle

#### Install dockle

![](pic/part5_dockle_install.png)

#### Check the image from the previous task with dockle `[image_id|repository]`

![](pic/part5_dockle_error.png)

#### Fix the image so that there are no errors or warnings when checking with dockle

![](pic/part5_dockle_resolve.png)

###  Part 6. Basic Docker Compose

##### Write a docker-compose.yml file, using which:
1) Start the docker container from Part 5 

2) Start the docker container with nginx which will proxy all requests from port 8080 to port 81 of the first container

##### Map port 8080 of the second container to port 80 of the local machine

![](pic/part6_docker_compose_yaml.png)
![](pic/part6_conf.png)

##### Stop all running containers

![](pic/part6_docker_ps.png)

##### Build and run the project with the `docker-compose build` and `docker-compose up` commands

![](pic/part6_docker-compose_build.png)

![](pic/part6_docker-compose_up.png)

##### Check that the browser returns the page you wrote on localhost:80 as before

![](pic/part6_checkpage.png)
