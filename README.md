# Beat Environment

This repository allows to play around with the different beats and kibana without having to configure everything. The setup is based on docker and spins up the necessary containers automatically.

```
git clone --recursive https://github.com/ruflin/beat-environment.git
cd beat-environment
make run
```

This will run to topbeat in your current docker-machine. To access the Kibana interface, go to http://docker-machine-ip:5601/

To fetch your docker-machine ip, run `docker-machine ip name-of-your-machine`. You can see the active names with `docker-machine ls`