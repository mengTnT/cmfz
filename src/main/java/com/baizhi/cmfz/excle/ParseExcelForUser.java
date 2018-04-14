package com.baizhi.cmfz.excle;

import java.io.InputStream;
import javax.servlet.http.HttpServletRequest;

import com.baizhi.cmfz.entity.User;
import com.baizhi.cmfz.service.UserService;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;


/**
 * 解析导入用户的工具类
 * @author yjl
 */
public class ParseExcelForUser {
	/**
	 * 解析导入用户的方法。getCellValue
	 */
	public static void parseAndImportUser(InputStream inputStream,UserService userService){
			try {
				// 将流中数据实例化为 HSSFWorkbook。
				HSSFWorkbook wb = new HSSFWorkbook(inputStream);
				// 获取sheet工作簿
				HSSFSheet sheet = wb.getSheetAt(0);
				int hang = 0;
				// 获取表中所有行
				hang = sheet.getPhysicalNumberOfRows();
				
				for (int h = 1; h < hang; h++) {
					// 获得工作表的行(用户)。
					User ul = new User();
					// 获取当前行数据
					HSSFRow row = sheet.getRow(h);

					Integer userId =Integer.parseInt(GetCellValue.getCellValue(row, 0));
					String telphone = GetCellValue.getCellValue(row, 1);
					String password = GetCellValue.getCellValue(row, 2);
					String userImage = GetCellValue.getCellValue(row, 3);
					String nickname = GetCellValue.getCellValue(row, 4);
					String name = GetCellValue.getCellValue(row, 5);
					String sex = GetCellValue.getCellValue(row, 6);
					String autograph = GetCellValue.getCellValue(row, 7);
					String userSheng = GetCellValue.getCellValue(row, 8);
					String userShi = GetCellValue.getCellValue(row, 9);
					String siId = GetCellValue.getCellValue(row, 10);
					/*private Integer userId;
					private String telphone;
					private String password;
					private String userImage;
					private String nickname;
					private String name;
					private String sex;
					private String autograph;
					private String userSheng;
					private String userShi;
					private Integer siId;*/
					ul.setUserId(userId);
					ul.setTelphone(telphone);
					ul.setPassword(password);
					ul.setUserImage(userImage);
					ul.setNickname(nickname);
					ul.setName(name);
					ul.setSex(sex);
					ul.setAutograph(autograph);
					ul.setUserSheng(userSheng);
					ul.setUserShi(userShi);
					ul.setSiId(siId);


					userService.addUser(ul);
				}
				inputStream.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		

	
}
