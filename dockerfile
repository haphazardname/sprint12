
FROM golang:1.25

WORKDIR /app

COPY go.mod go.sum ./
RUN go mod download
RUN go get modernc.org/sqlite@latest


COPY . .

RUN GOOS=linux GOARCH=amd64 go build -o /42

CMD ["/42"]