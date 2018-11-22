

## build 
```
docker build -t tkngue/supporterz-colab-python:latest .
```

## run 
```
docker run -it --name flask --rm -p 8080 tkngue/supporterz-colab-python:latest -h 0.0.0.0 -p 8080
```

## check 
```
curl $(docker port flask 8080)

> Hello World!
````
