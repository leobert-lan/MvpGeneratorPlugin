plugins {
    id("org.jetbrains.intellij.platform") version "2.7.2"
    kotlin("jvm") version "1.9.24"
}

group = "osp.leobert.plugins.qt.mvpgenerator"
version = "1.0.0"

repositories {
    maven {
        url = uri("https://maven.aliyun.com/repository/central")
    }
    mavenLocal()
//    mavenCentral()
    intellijPlatform {
        defaultRepositories()
    }
}

kotlin {
    jvmToolchain(17)
}

dependencies {
    intellijPlatform {
        intellijIdeaCommunity("2024.1")
//        clion("2025.1")
    }
}

tasks {
    patchPluginXml {
        changeNotes.set("MVP stub code generator.")
    }
}
