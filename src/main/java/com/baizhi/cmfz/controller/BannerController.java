package com.baizhi.cmfz.controller;

import com.baizhi.cmfz.entity.Banner;
import com.baizhi.cmfz.service.BannerService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
public class BannerController {
    @Autowired
    private BannerService bannerService;

    @RequestMapping("getAllBanner")
    @ResponseBody
    public Map getAllBanner(int page,int rows) {

        return bannerService.getAllBanner(page,rows);
    }

    @RequestMapping("addBanner")
    @ResponseBody
    public int addBanner(Banner banner, MultipartFile image, HttpServletRequest request) throws IllegalStateException, IOException {
        //得到原始文件名
        String pic = image.getOriginalFilename();
        //获取到images的绝对路径，表示要上传到哪个文件夹
        String realPath = request.getRealPath("picture/shouye/");
        //通过时间重命名、时间+源文件名重命名,防止重名
        pic = new Date().getTime() + "_" + pic;
        File file = new File(realPath + "/" + pic);

        //把原始文件名赋值给对象
        banner.setBannerImage("/shouye/" + pic);
        //把上传上来的文件转换为磁盘文件
        image.transferTo(file);
        Map map=new HashMap();
        int result=bannerService.addBanner(banner);

        return result;
    }

    @RequestMapping("deleteBanner")
    @ResponseBody
    public int deleteBanner(int[] ids) {

        return bannerService.deleteBanner(ids);
    }

    @RequestMapping("updateBanner")
    @ResponseBody
    public int updateBanner(Banner banner, MultipartFile image, HttpServletRequest request) throws IllegalStateException, IOException {

        if (image.isEmpty()) {
            return bannerService.updateBanner(banner);

        }
        else {
            //得到原始文件名
            String pic = image.getOriginalFilename();
            //获取到images的绝对路径，表示要上传到哪个文件夹
            String realPath = request.getRealPath("picture/shouye/");
            //通过时间重命名、时间+源文件名重命名,防止重名
            pic = new Date().getTime() + "_" + pic;
            File file = new File(realPath + "/" + pic);

            //把原始文件名赋值给对象
            banner.setBannerImage("/shouye/" + pic);
            //把上传上来的文件转换为磁盘文件
            image.transferTo(file);
            return bannerService.updateBanner(banner);
        }

    }


}
