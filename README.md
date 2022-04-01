# Loading page with injected environment variables

## How to use

    docker build -t loading-page .
    docker run -e LOADING_PERCENTAGE=*percentage* -e LOADING_MESSAGE=*message* -p 8080:80 demo

Visit http://localhost:8080 to see the result.
