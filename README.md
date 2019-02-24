# Stack
This Dockerfile supports the following stack:
* Ubuntu 	18.04 
* NVM 	v0.34.0
* Node.js 11.10.0

Feel free to fork this repo and modify the versions of Ubuntu, NVM, and Node.js to whatever you need them to be.


# Building
```
git clone git@github.com:ardeearam/docker-node.git
cd docker-node
docker build . -t aaram/node
```

# Use as docker executable
```
$ docker run aaram/node
# v11.10.0

$ docker run aaram/node -e "console.log('Hello world');"
# Hello world

# For some Node.js executable at ~/test.js
$ docker run -v ~/test.js:/tmp/test.js aaram/node /tmp/test.js 
# Test.js succesfully executed.
```

# Use as docker base image 
```
# In Dockerfile. App is in same directory as Dockerfile file.

FROM aaram/node

WORKDIR /home/app
COPY . /home/app

RUN /tmp/runner.sh npm install

ENTRYPOINT ["/tmp/runner.sh", "npm", "start"]

```

# License

MIT License

Copyright (c) 2019 Ardee Aram

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
