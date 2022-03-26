# <img src="https://adoptium.net/dist/assets/adoptium_logo.svg" width="48" height="48"/> [Eclipse Adoptium Temurin 11]()

Java™ is the world's leading programming language and platform.

The Adoptium Working Group promotes and supports high-quality, TCK certified runtimes and associated technology for use across the Java™ ecosystem.

[Eclipse Temurin](https://adoptium.net/faq.html?variant=openjdk11&jvmVariant=hotspot#temurinName) is the name of the OpenJDK distribution from Adoptium.

## Package parameters

- `/NoFeatureEnvironment` - Do not add Eclipse Adoptium Temurin 11 to system PATH.

- `/NoFeatureJarFileRunWith` - Do not associate .jar files to run with Eclipse Adoptium Temurin 11.

- `/FeatureJavaHome` - Set JAVA_HOME environment variable.

- `/FeatureOracleJavaSoft` - Overwrites the reg keys "HKLM\Software\...\javapath" does not work. You need to reinstall it to recreate these registry keys.

Example: `choco install eclipse-adoptium-temurin17 --params "/FeatureJavaHome"`