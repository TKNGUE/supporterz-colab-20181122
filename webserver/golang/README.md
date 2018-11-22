
build
```
docker build -t tkngue/supporterz-colab-golang:latest .
```

run
```
docker run -it --rm -p 8080 --name golang tkngue/supporterz-colab-golang:latest
```

check
```
curl $(docker port golang 8080)
```
