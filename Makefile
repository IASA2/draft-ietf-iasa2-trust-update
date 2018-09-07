
PREV=	draft-arkko-iasa2-trust-update-00.txt
ALL=	draft-ietf-iasa2-trust-update.txt \
	draft-ietf-iasa2-trust-update-diff.html

all:	$(ALL)

draft-ietf-iasa2-trust-update.txt \
draft-ietf-iasa2-trust-update-diff.html:	draft-ietf-iasa2-trust-update.xml
	scp draft-ietf-iasa2-trust-update.xml $(PREV) jar@arkko.eu:
	ssh jar@arkko.eu xml2rfc draft-ietf-iasa2-trust-update.xml
	ssh jar@arkko.eu rfcdiff $(PREV) draft-ietf-iasa2-trust-update.txt
	scp jar@arkko.eu:draft-ietf-iasa2-trust-update.txt .
	scp jar@arkko.eu:draft-ietf-iasa2-trust-update-from-arkko-iasa2-trust-update-00.diff.html \
	    draft-ietf-iasa2-trust-update-diff.html

copy:	$(ALL)
	scp draft-ietf-iasa2-trust-update.txt \
	    draft-ietf-iasa2-trust-update-diff.html \
	    jar@cloud1.arkko.eu:/var/www/www.arkko.com/html/ietf/iasa20
