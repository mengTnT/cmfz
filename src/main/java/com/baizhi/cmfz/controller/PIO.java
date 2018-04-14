package com.baizhi.cmfz.controller;

import com.baizhi.cmfz.entity.User;
import com.baizhi.cmfz.excle.ExportExcelForUser;
import com.baizhi.cmfz.excle.ParseExcelForUser;
import com.baizhi.cmfz.service.UserService;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
@Controller
public class PIO {
    @Autowired
    private UserService userService;
    @RequestMapping("exportMessage")//之后异步请求传递数组：加上此属性： traditional:true  防止参数深度序列化的  ids=1  ids=2
    public @ResponseBody Map<String,Object> exportMessage(int[] ids, HttpServletRequest req, HttpServletResponse res){
        Map<String,Object> map = new HashMap<String,Object>();
        try {
            //文件名称    处理
            Date date = new Date();
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss");
            String time = sdf.format(date);
            // 不允许出现特殊字符
            String fileName = "用户"+ time + ".xls";

            //用户   查询
            List<User> users = userService.findUserByIds(ids);

            // 第一步，创建一个webbook，对应一个Excel文件 核心处理对象
            HSSFWorkbook wb = new HSSFWorkbook();
            // 为当前工作簿 创建名字
            String sheetName = new SimpleDateFormat("yyyy-MM-dd-HH-mm-ss").format(new Date());

            // 第二步，在webbook中添加一个sheet,对应Excel文件中的sheet 并设置工作簿名字
            HSSFSheet sheet = wb.createSheet(sheetName);

            // 通过工具类创建表格 以及设值
            ExportExcelForUser.createExcelOfUser(users, sheet);

            ExportExcelForUser.setAttachmentFileName(req, res, fileName);
            // 从响应获取输出流  将数据写出去
            OutputStream out = res.getOutputStream();
            wb.write(out);
            // 保证数据的完整性   100k    80k
            out.flush();
            out.close();
            map.put("message", true);
        } catch (Exception e) {
            e.printStackTrace();
            map.put("message", false);
        }
        return map;
    }
    /**
     * 导入用户。
     *
     * @param request
     *            HttpServletRequest 用来存储和获取数据。
     * @param response
     *            HttpServletResponse 用来响应数据信息。
     * @return 重定向到展示用户列表。
     */
    @RequestMapping("importUser")
    public void importUser(HttpServletRequest request, MultipartFile fileName, HttpServletResponse response) {
        try {

            // 1. 从流中获取文件数据
            InputStream inputStream = fileName.getInputStream();
            // 读取文件数据
            ParseExcelForUser.parseAndImportUser(inputStream, userService); // 通过工具类保存用户。
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
