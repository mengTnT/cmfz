package com.baizhi.cmfz.excle;

import java.io.UnsupportedEncodingException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.baizhi.cmfz.entity.User;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;


public class ExportExcelForUser {
	/**
	 * 备份用户的excel数据文件方法。
	 * 
	 *
	 * 
	 *       
	 */
	public static void createExcelOfUser(List<User> users,
			HSSFSheet sheetForAuth) {
		// 第三步，在sheet中添加表头第0行  0  代表第一行
		HSSFRow rowHead = sheetForAuth.createRow(0);
		// 第四步，创建单元格，并设置值表头 
		rowHead.createCell(0).setCellValue("id");
		rowHead.createCell(1).setCellValue("电话");
		rowHead.createCell(2).setCellValue("密码");
		rowHead.createCell(3).setCellValue("用户头像");
		rowHead.createCell(4).setCellValue("昵称");
		rowHead.createCell(5).setCellValue("姓名");
		rowHead.createCell(6).setCellValue("性别");
		rowHead.createCell(7).setCellValue("签名");
		rowHead.createCell(8).setCellValue("省份");
		rowHead.createCell(9).setCellValue("地市");
		rowHead.createCell(10).setCellValue("所属上师id");

		User al = new User();

        // 第五步，写入实体数据 实际应用中这些数据从数据库得到，
		if (users != null) {
			//    8      从集合的最高下标 递减 添加数据
			for (int i = users.size() - 1; i >= 0; i--) {

				al = users.get(i);
				String userId = al.getUserId().toString();
				String telphone = al.getTelphone();
				String password = al.getPassword();
				String userImage = al.getUserImage();
				String nickname = al.getNickname();
				String name = al.getName();
				String sex = al.getSex();
				String autograph = al.getAutograph();
				String userSheng = al.getUserSheng();
				String userShi = al.getUserShi();
				String siId = al.getSiId();



				// 创建行
				HSSFRow row = sheetForAuth.createRow(i + 1);

				row.createCell(0).setCellValue(userId);
				row.createCell(1).setCellValue(telphone);
				row.createCell(2).setCellValue(password);
				row.createCell(3).setCellValue(userImage);
				row.createCell(4).setCellValue(nickname);
				row.createCell(5).setCellValue(name);
				row.createCell(6).setCellValue(sex);
				row.createCell(7).setCellValue(autograph);
				row.createCell(8).setCellValue(userSheng);
				row.createCell(9).setCellValue(userShi);
				row.createCell(10).setCellValue(siId);
			}
		}

	}
	/**
	 * 设置下载文件编码/响应格式
	 * 
	 * @param request
	 * @param response
	 * @param fileName
	 * @throws UnsupportedEncodingException
	 */
	public final static void setAttachmentFileName(HttpServletRequest request,
			HttpServletResponse response, String fileName)
			throws UnsupportedEncodingException {

		response.setCharacterEncoding("UTF-8");
		// 下载响应格式
		response.setContentType("application/octet-stream;charset=UTF-8");
		// 防止中文乱码，设置文本的编码格式
		fileName = new String(fileName.getBytes("GBK"), "ISO-8859-1");
		response.setHeader("Content-Disposition", "attachment; filename="+ fileName);
	}
}
