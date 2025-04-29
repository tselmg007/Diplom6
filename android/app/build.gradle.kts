plugins {
    id("com.android.application")
    id("kotlin-android")
    id("dev.flutter.flutter-gradle-plugin")
    id("com.google.gms.google-services")
}

android {
    namespace = "com.example.traffic"
    compileSdk = 35
    ndkVersion = "27.0.12077973" // ✅ Зөв бичиглэл Kotlin DSL-д

    defaultConfig {
        applicationId = "com.example.traffic"
        minSdk = 23                  // ✅ Kotlin DSL: `minSdkVersion` биш, `minSdk`
        targetSdk = 35              // ✅ `targetSdkVersion` биш
        versionCode = 1
        versionName = "1.0"
    }

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_17
        targetCompatibility = JavaVersion.VERSION_17
    }

    kotlinOptions {
        jvmTarget = "17"
    }

    buildTypes {
         getByName("release") {
        isMinifyEnabled = true         // ✅ ашиглагдаагүй код шахах
        isShrinkResources = true       // ✅ ашиглагдаагүй зураг, XML устгах
        signingConfig = signingConfigs.getByName("debug") // түр зуурын debug гарын үсэг
        proguardFiles(getDefaultProguardFile("proguard-android-optimize.txt"), "proguard-rules.pro")
        }
    }
}

flutter {
    source = "../.."
}

dependencies {
    implementation(platform("com.google.firebase:firebase-bom:33.12.0"))
}
