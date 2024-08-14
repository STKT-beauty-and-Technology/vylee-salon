# Keep all GIFs and images intact
-keep class **.R$drawable {
    public static final int *;
}

-keepclassmembers class **.R$drawable {
    public static <fields>;
}

-keep class * extends android.os.Binder { *; }

# If using Glide or another image library, keep its classes
-keep class com.bumptech.glide.** { *; }

# Keep assets from being stripped
-keepresources /raw/.*
-keepresources /assets/.*


