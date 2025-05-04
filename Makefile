
doc:
	./doc.sh

all:
	./get.sh

zip:
	rm -f ../all.zip
	zip -1 ../all.zip *.zip

clean:
	rm -f *.zip list.txt .zip

