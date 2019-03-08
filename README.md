# safaribooks-downloader with docker-compose


## how to download ebooks

* create one oreilly account

```code
from https://learning.oreilly.com
```

* add account env file && add you account info

```code
touch .account.env

content like below

USERNAME=<yourid>
PASSWORD=<youpassword>
```

## do download

* use curl or other http utils

```code
curl -X POST \
  http://localhost:8888/download \
  -H 'Content-Type: application/json' \
  -d '{
	"ebookid":"<ebookid>"
}'
```

* view download files

```code
http://localhost:8888/ebooks  

and you can view  size && download epub file
```