export JAVA_HOME=$(/usr/libexec/java_home)

use_java6() {
  export JAVA_HOME=/System/Library/Java/JavaVirtualMachines/1.6.0.jdk/Contents/Home
  export PATH="$JAVA_HOME/bin:$PATH"
}

export PATH="/usr/local/Cellar/jruby/1.7.4/libexec/bin:$PATH"