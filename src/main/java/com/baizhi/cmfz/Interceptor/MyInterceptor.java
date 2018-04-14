package com.baizhi.cmfz.Interceptor;

import com.baizhi.cmfz.Log.ServiceLog;
import com.baizhi.cmfz.entity.Admin;
import com.baizhi.cmfz.entity.AdminLog;
import com.baizhi.cmfz.service.AdminLogService;
import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;
import org.apache.shiro.SecurityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.util.Date;

public class MyInterceptor implements MethodInterceptor {
    @Autowired
    private AdminLogService adminLogService;
   /* private  Integer i;*/
    private String str;
    @Override
    public Object invoke(MethodInvocation methodInvocation) throws Throwable {
        AdminLog adminLog=new AdminLog();
        //开始时间
        long start = System.currentTimeMillis();
        // 获取到 当前执行的方法
        Method method = methodInvocation.getMethod();
        // 获取方法上的注解
        ServiceLog log = method.getAnnotation(ServiceLog.class);
        String methodName = log.value();
        // 记录日志  用户  +  操作方法  + 时间  +  操作结果
        //设置日志对象的方法名称
        adminLog.setMethodName(methodName);

            // 在已登录情况下，记录日志
            //System.out.println(admin.getUsername()+"正在执行2---"+methodName+new Date()+"------切面");
            // 拿到map返回值  String message = map.get("flag");
            Object proceed = methodInvocation.proceed();
            String username2 = SecurityUtils.getSubject().getPrincipal().toString();
            adminLog.setCreateDate(new Date());
            str = (String) proceed.toString();
            //这种判断需要进一步改进
            if(str!=null){
                adminLog.setResult("执行成功");
            }
            else{
                adminLog.setResult("执行失败");
            }

            adminLog.setAdminname(username2);

            // 记录日志  ---  数据库  执行数据库的插入

        //结束时间
        long end = System.currentTimeMillis();
        //时间差  毫秒为单位
        long time=end-start;
        String t=time+"毫秒";
        adminLog.setMethodExcuteDate(t);
        adminLogService.addAdminLog(adminLog);
        return proceed;

    }

    
}
