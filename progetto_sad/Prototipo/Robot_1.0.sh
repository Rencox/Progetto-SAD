PERCORSO="$(cd "$(dirname "$0")" && pwd)"

sleep 3

cd $PERCORSO

cd ..

cp -n evosuite-1.0.6.jar Prototipo

cp -n evosuite-standalone-runtime-1.0.6.jar Prototipo

cd $PERCORSO

java -jar evosuite-1.0.6.jar

sleep 2

export EVOSUITE="java -jar $(pwd)/evosuite-1.0.6.jar"

mvn compile

echo "iniziamo a generare i test"

$EVOSUITE -class calcolatrice.Calcolatrice -projectCP target/classes

echo "facciamo partire i test"

mvn dependency:copy-dependencies

export CLASSPATH=target/classes:evosuite-standalone-runtime-1.0.6.jar:evosuite-tests:target/dependency/junit-4.13.1.jar:target/dependency/hamcrest-core-1.3.jar


javac evosuite-tests/calcolatrice/*.java

java org.junit.runner.JUnitCore calcolatrice.Calcolatrice_ESTest
