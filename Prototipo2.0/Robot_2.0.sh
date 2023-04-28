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

$EVOSUITE -class sciatore.sciatore -projectCP target/classes

echo "facciamo partire i test"

mvn dependency:copy-dependencies

export CLASSPATH=target/classes:evosuite-standalone-runtime-1.0.6.jar:evosuite-tests:target/dependency/junit-4.13.1.jar:target/dependency/hamcrest-core-1.3.jar


javac evosuite-tests/sciatore/*.java

java org.junit.runner.JUnitCore sciatore.sciatore_ESTest

sleep 2

$EVOSUITE -measureCoverage -class sciatore.sciatore -Djunit=sciatore.sciatore_ESTest -projectCP $PERCORSO/target/classes/:evosuite-tests -Dcriterion=LINE

$EVOSUITE -measureCoverage -class sciatore.sciatore -Djunit=sciatore.sciatore_ESTest -projectCP $PERCORSO/target/classes/:evosuite-tests -Dcriterion=BRANCH

$EVOSUITE -measureCoverage -class sciatore.sciatore -Djunit=sciatore.sciatore_ESTest -projectCP $PERCORSO/target/classes/:evosuite-tests -Dcriterion=EXCEPTION

$EVOSUITE -measureCoverage -class sciatore.sciatore -Djunit=sciatore.sciatore_ESTest -projectCP $PERCORSO/target/classes/:evosuite-tests -Dcriterion=WEAKMUTATION

$EVOSUITE -measureCoverage -class sciatore.sciatore -Djunit=sciatore.sciatore_ESTest -projectCP $PERCORSO/target/classes/:evosuite-tests -Dcriterion=OUTPUT

$EVOSUITE -measureCoverage -class sciatore.sciatore -Djunit=sciatore.sciatore_ESTest -projectCP $PERCORSO/target/classes/:evosuite-tests -Dcriterion=METHOD

$EVOSUITE -measureCoverage -class sciatore.sciatore -Djunit=sciatore.sciatore_ESTest -projectCP $PERCORSO/target/classes/:evosuite-tests -Dcriterion=METHODNOEXCEPTION

$EVOSUITE -measureCoverage -class sciatore.sciatore -Djunit=sciatore.sciatore_ESTest -projectCP $PERCORSO/target/classes/:evosuite-tests -Dcriterion=CBRANCH


