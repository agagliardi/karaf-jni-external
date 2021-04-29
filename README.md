# karaf-jni-external

* Red Hat Fuse 7.8.0 (Karaf/OSGi container)
* Openjdk 1.8
* RHEL 7.9

## How to run

* build native library and JNI wrapper with `make`
* build java code with `mvn -F java`

## Install
osgi:install -s mvn:com.rh.example/karaf-jni-external/1.0.0

