all: clean compilejava compilec copytomaven
EXT=so
ARCH=linux#$(shell uname -s | tr '[:upper:]' '[:lower:]')
SHARED_OPTION=-shared
CC_LIB=-L./target/lib -lExternalFunction

compilec:
	mkdir -p target/lib
	cc -g $(SHARED_OPTION) c/ExternalFunction.c -o target/lib/libExternalFunction.$(EXT) -fPIC
	cc -g $(SHARED_OPTION) -I${JAVA_HOME}/include -I${JAVA_HOME}/include/$(ARCH) c/com_rh_example_HelloWorld.c $(CC_LIB) -o target/lib/libHelloWorld.$(EXT) -fPIC
	patchelf --set-rpath .:$$\ORIGIN target/lib/libHelloWorld.$(EXT)

compilejava:
	mkdir -p target
	$(JAVA_HOME)/bin/javac -h c -d target  java/src/main/java/com/rh/example/HelloWorld.java

copytomaven:
	cp target/lib/* java/src/main/resources/

clean: 
	rm -rf c/com_rh_example_HelloWorld.h
	rm -rf target/

