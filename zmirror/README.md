## zmirror-docker 
dockerfile for zmirror 

## build

build your docker image on shell:  
> ```$ docker build -t {your_user_name}/zmirror . ```

and test:
> ```$ docker run -it --rm -p 80:80 {your_user_name}/zmirror ```

## run

* step 1:  
> ```$ curl -k -L -o config.py https://github.com/aploium/zmirror/raw/master/more_configs/config_google_and_zhwikipedia.py ```
* step 2:  
> ```$ nano config.py```  \#\# edit 'my_host_name'
* step 3:  
> ```$ docker run -d --name google -p 80:80 -v $PWD/config.py:/var/www/zmirror/config.py {your_user_name}/zmirror ```

## for https
> ```$ cp /{your_certs_path}/cert.pem certs/{your_host_name}.crt```  
> ```$ cp /{your_certs_path}/privkey.pem certs/{your_host_name}.key```  
> ```$ nano docker-compose.yaml```  \#\# edit 'your_host_name'  
> ```$ docker-compose up -d ```

enjoy!