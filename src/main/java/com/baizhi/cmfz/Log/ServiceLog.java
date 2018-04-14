package com.baizhi.cmfz.Log;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

@Target({ElementType.METHOD})
// 在运行时，jvm保留注解数据
@Retention(RetentionPolicy.RUNTIME)
public @interface ServiceLog {
    String value() default "";
}
