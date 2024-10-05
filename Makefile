DERBY=./downloads/db-derby-10.17.1.0-bin/db-derby-10.17.1.0-bin/lib/derby.jar
DERBYNET=./downloads/db-derby-10.17.1.0-bin/db-derby-10.17.1.0-bin/lib/derbynet.jar
DERBY_CLIENT=./downloads/db-derby-10.17.1.0-bin/db-derby-10.17.1.0-bin/lib/derbyclient.jar
DERBY_TOOLS=./downloads/db-derby-10.17.1.0-bin/db-derby-10.17.1.0-bin/lib/derbytools.jar


BUILD_DIR=build

ARGS?=

build: simpledb.build

clean:
	rm -rf build


##
# derby

derby.ij:
	java -cp "$(DERBY_TOOLS)" org.apache.derby.tools.ij

derby.server:
	java -cp "$(DERBYNET)" org.apache.derby.drda.NetworkServerControl $(ARGS)

##
# simpledb sever

simpledb.build:
	javac -d $(BUILD_DIR) -sourcepath simpledb/src simpledb/src/**/**/*.java

simpledb.server: simpledb.build
	java -cp $(BUILD_DIR) simpledb.server.StartServer $(ARGS)


##
# simpledb clients (TODO)
