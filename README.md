# safaribooks-downloader with docker-compose


## how to download ebooks

* create one oreilly account

```code
from https://learning.oreilly.com
```

* add account env file && add you account info

> note you can alse pass the account info to request body

```code
touch .account.env

content like below

USERNAME=<yourid>
PASSWORD=<youpassword>
```

## do download

* use curl or other http utils

no need account info with  build in account

```code
curl -X POST \
  http://localhost:8888/download \
  -H 'Content-Type: application/json' \
  -d '{
	"ebookid":"<ebookid>"
}'
```

or  use your accountinfo

```code
curl -X POST \
  http://localhost:8888/download \
  -H 'Content-Type: application/json' \
  -d '{
	"ebookid":"<ebookid>",
  "username":"<accountid>",
  "password":"<password>"
}'
```

* view download files

```code
http://localhost:8888/ebooks  

and you can view  size && download epub file
```