# CutyCapt

This is a cloned and patched CutyCapt repo based on the:
* https://github.com/hoehrmann/CutyCapt
* https://github.com/oracle/infinity-cutycapt

## Building
~~~
docker build -t cutycapt .
~~~

## Running
~~~
docker run --rm -v "$PWD:/out" --name cutycapt cutycapt bash -c "sleep 1; xvfb-run -a -l -e /dev/stdout cutycapt --url=http://google.com --out=/out/google.png"
~~~
