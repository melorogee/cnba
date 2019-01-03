package com.sunflower.controller;

import com.alibaba.druid.support.json.JSONUtils;
import com.fasterxml.jackson.annotation.ObjectIdGenerators;
import com.sunflower.entity.User;
import com.sunflower.service.impl.MetadataServiceImpl;
import com.sunflower.util.DateUtil;
import com.sunflower.util.RedisUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.ContextLoader;
import org.springframework.web.context.WebApplicationContext;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

@Controller
@ContextConfiguration("classpath:redis-context.xml")
@RequestMapping("/metadata")
public class MetadataController {

    @Autowired
    private MetadataServiceImpl metadataService;
    @Autowired
    private RedisUtil redisUtil;

    @RequestMapping("/aboutus.do") //url
    public String about_us() {
        return "jsp/aboutus";
    }

String url = "http://47.101.219.55";

    @RequestMapping(value = "/fpage.do", method = RequestMethod.GET)
    public String getFpage(HttpServletRequest req) {
        return "jsp/showFpage";
    }

    @RequestMapping(value = "/introduction.do", method = RequestMethod.GET)
    public String introduction(HttpServletRequest req) {
        return "jsp/introduction";
    }

    @RequestMapping(value = "/culture.do", method = RequestMethod.GET)
    public String culture(HttpServletRequest req) {
        return "jsp/culture";
    }

    @RequestMapping(value = "/file.do", method = RequestMethod.GET)
    public String file(HttpServletRequest req) {
        return "jsp/file";
    }

    @RequestMapping(value = "/brandbuild.do", method = RequestMethod.GET)
    public String brandbuild(HttpServletRequest req) {
        return "jsp/brandbuild";
    }

    @RequestMapping(value = "/trainning.do", method = RequestMethod.GET)
    public String trainning(HttpServletRequest req) {
        return "jsp/trainning";
    }

    @RequestMapping(value = "/honner.do", method = RequestMethod.GET)
    public String honner(HttpServletRequest req) {
        return "jsp/xiangce";
    }

    @RequestMapping(value = "/news.do", method = RequestMethod.GET)
    public String news(HttpServletRequest req) {
        return "jsp/news";
    }

    @RequestMapping(value = "/new.do", method = RequestMethod.GET)
    public String newnew(HttpServletRequest req) {
        return "jsp/new";
    }

    @RequestMapping(value = "/sqba.do", method = RequestMethod.GET)
    public String sqba(HttpServletRequest req) {
        return "jsp/sqba";
    }

    @RequestMapping(value = "/scba.do", method = RequestMethod.GET)
    public String scba(HttpServletRequest req) {
        return "jsp/scba";
    }

    @RequestMapping(value = "/dxhdba.do", method = RequestMethod.GET)
    public String dxhdba(HttpServletRequest req) {
        return "jsp/dxhdba";
    }


    @RequestMapping(value = "/jobs.do", method = RequestMethod.GET)
    public String jobs(HttpServletRequest req) {
        return "jsp/jobs";
    }

    @RequestMapping(value = "/job.do", method = RequestMethod.GET)
    public String job(HttpServletRequest req) {
        return "jsp/job";
    }

    @RequestMapping("/index_m.do") //url
    public String index_m() {
        return "jsp/index_m";
    }

    @RequestMapping("/introduction_m.do") //url
    public String introduction_m() {
        return "jsp/introduction_m";
    }

    @RequestMapping("/culture_m.do") //url
    public String culture_m() {
        return "jsp/culture_m";
    }

    @RequestMapping("/file_m.do") //url
    public String file_m() {
        return "jsp/file_m";
    }
    @RequestMapping("/brandbuild_m.do") //url
    public String brandbuild_m() {
        return "jsp/brandbuild_m";
    }
    @RequestMapping("/trainning_m.do") //url
    public String trainning_m() {
        return "jsp/trainning_m";
    }

    @RequestMapping("/sqba_m.do") //url
    public String sqba_m() {
        return "jsp/sqba_m";
    }

    @RequestMapping("/aboutus_m.do") //url
    public String aboutus_m() {
        return "jsp/aboutus_m";
    }

    @RequestMapping("/scba_m.do") //url
    public String scba_m() {
        return "jsp/scba_m";
    }

    @RequestMapping("/news_m.do") //url
    public String news_m() {
        return "jsp/news_m";
    }
    @RequestMapping("/new_m.do") //url
    public String new_m() {
        return "jsp/new_m";
    }


    /**
     * 关于我们
     *
     * @param req
     * @param resp
     */
    @RequestMapping(value = "/get_aboutus.do")
    public void get_aboutus(HttpServletRequest req, HttpServletResponse resp) {
        try {
            //获取aboutus
            List<Map<String, Object>>  retList = metadataService.get_aboutus();
            String jsonString = JSONUtils.toJSONString(retList);
            req.setCharacterEncoding("UTF-8");
            resp.setCharacterEncoding("UTF-8");
            resp.getWriter().write(jsonString);
            resp.getWriter().flush();
            resp.getWriter().close();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }



    /**
     * 初始化banner
     *
     * @param req
     * @param resp
     */
    @RequestMapping(value = "/initBanner.do")
    public void initBanner(HttpServletRequest req, HttpServletResponse resp) {
        try {
            // 获取banner
            List<Map<String, Object>>  retList =  metadataService.initBanner();
            String jsonString = JSONUtils.toJSONString(retList);
            req.setCharacterEncoding("UTF-8");
            resp.setCharacterEncoding("UTF-8");
            resp.getWriter().write(jsonString);
            resp.getWriter().flush();
            resp.getWriter().close();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }


    /**
     * 首页公司动态列表
     *
     * @param req
     * @param resp
     */
    @RequestMapping(value = "/initCompanyNewsList")
    public void initCompanyNewsList(HttpServletRequest req, HttpServletResponse resp) {
        try {
            List<Map<String, Object>> retList = metadataService.initCompanyNewsList();
            String jsonString = JSONUtils.toJSONString(retList);
            req.setCharacterEncoding("UTF-8");
            resp.setCharacterEncoding("UTF-8");
            resp.getWriter().write(jsonString);
            resp.getWriter().flush();
            resp.getWriter().close();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }




    /**
     * 首页友情链接列表
     *
     * @param req
     * @param resp
     */
    @RequestMapping(value = "/initFriendLinks")
    public void initFriendLinks(HttpServletRequest req, HttpServletResponse resp) {
        try {
            List<Map<String, Object>> retList = metadataService.initFriendLinks();
            String jsonString = JSONUtils.toJSONString(retList);
            req.setCharacterEncoding("UTF-8");
            resp.setCharacterEncoding("UTF-8");
            resp.getWriter().write(jsonString);
            resp.getWriter().flush();
            resp.getWriter().close();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }



    /**
     * 公司简介
     *
     * @param req
     * @param resp
     */
    @RequestMapping(value = "/companyIntroduction")
    public void companyIntroduction(HttpServletRequest req, HttpServletResponse resp) {
        try {
            List<Map<String, Object>> retList = metadataService.companyIntroduction();
            String jsonString = JSONUtils.toJSONString(retList);
            req.setCharacterEncoding("UTF-8");
            resp.setCharacterEncoding("UTF-8");
            resp.getWriter().write(jsonString);
            resp.getWriter().flush();
            resp.getWriter().close();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }



    @RequestMapping(value = "/save_companyIntroduction")
    public void save_companyIntroduction(HttpServletRequest req, HttpServletResponse resp) {
        try {
            String content = req.getParameter("content");
            metadataService.save_companyIntroduction(content);
            String jsonString = JSONUtils.toJSONString("0");
            req.setCharacterEncoding("UTF-8");
            resp.setCharacterEncoding("UTF-8");
            resp.getWriter().write(jsonString);
            resp.getWriter().flush();
            resp.getWriter().close();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
    /**
     * 品牌建设
     *
     * @param req
     * @param resp
     */
    @RequestMapping(value = "/brandBuild")
    public void brandBuild(HttpServletRequest req, HttpServletResponse resp) {
        try {
            // 获取banner
            List<Map<String, Object>> retList = metadataService.brandBuild();
            String jsonString = JSONUtils.toJSONString(retList);
            req.setCharacterEncoding("UTF-8");
            resp.setCharacterEncoding("UTF-8");
            resp.getWriter().write(jsonString);
            resp.getWriter().flush();
            resp.getWriter().close();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }




    /**
     * 商场保安
     *
     * @param req
     * @param resp
     */
    @RequestMapping(value = "get_scba")
    public void get_scba(HttpServletRequest req, HttpServletResponse resp) {
        try {
            List<Map<String, Object>> retList = metadataService.get_scba();

            String jsonString = JSONUtils.toJSONString(retList);
            req.setCharacterEncoding("UTF-8");
            resp.setCharacterEncoding("UTF-8");
            resp.getWriter().write(jsonString);
            resp.getWriter().flush();
            resp.getWriter().close();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    /**
     * 社区保安
     *
     * @param req
     * @param resp
     */
    @RequestMapping(value = "get_sqba")
    public void get_sqba(HttpServletRequest req, HttpServletResponse resp) {
        try {
            List<Map<String, Object>> retList = metadataService.get_sqba();

            String jsonString = JSONUtils.toJSONString(retList);
            req.setCharacterEncoding("UTF-8");
            resp.setCharacterEncoding("UTF-8");
            resp.getWriter().write(jsonString);
            resp.getWriter().flush();
            resp.getWriter().close();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }




    /**
     * 培训
     *
     * @param req
     * @param resp
     */
    @RequestMapping(value = "/gettraining")
    public void training(HttpServletRequest req, HttpServletResponse resp) {
        try {
            // 获取banner
            List<Map<String, Object>> retList = metadataService.gettraining();

            String jsonString = JSONUtils.toJSONString(retList);
            req.setCharacterEncoding("UTF-8");
            resp.setCharacterEncoding("UTF-8");
            resp.getWriter().write(jsonString);
            resp.getWriter().flush();
            resp.getWriter().close();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }




    /**
     * 公司文化
     *
     * @param req
     * @param resp
     */
    @RequestMapping(value = "/companyCulture")
    public void companyCulture(HttpServletRequest req, HttpServletResponse resp) {
        try {

            List<Map<String, Object>> retList = metadataService.companyCulture();

            String jsonString = JSONUtils.toJSONString(retList);
            req.setCharacterEncoding("UTF-8");
            resp.setCharacterEncoding("UTF-8");
            resp.getWriter().write(jsonString);
            resp.getWriter().flush();
            resp.getWriter().close();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }


    /**
     * 公司档案
     *
     * @param req
     * @param resp
     */
    @RequestMapping(value = "/companyFiles")
    public void companyFiles(HttpServletRequest req, HttpServletResponse resp) {
        try {
            // 获取banner

            List<Map<String, Object>> retList = metadataService.companyFiles();

            String jsonString = JSONUtils.toJSONString(retList);
            req.setCharacterEncoding("UTF-8");
            resp.setCharacterEncoding("UTF-8");
            resp.getWriter().write(jsonString);
            resp.getWriter().flush();
            resp.getWriter().close();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }



    /**
     * 首页公司动态列表
     *
     * @param req
     * @param resp
     */
    @RequestMapping(value = "/initCompanyContent")
    public void initCompanyContent(HttpServletRequest req, HttpServletResponse resp) {
        try {
            String id = req.getParameter("id");


            List<Map<String, Object>> retList = metadataService.initCompanyContent(id);

            String jsonString = JSONUtils.toJSONString(retList);
            req.setCharacterEncoding("UTF-8");
            resp.setCharacterEncoding("UTF-8");
            resp.getWriter().write(jsonString);
            resp.getWriter().flush();
            resp.getWriter().close();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }





    @RequestMapping(value = "/save_companyCulture")
    public void save_companyCulture(HttpServletRequest req, HttpServletResponse resp) {
        try {
            String content = req.getParameter("content");
            metadataService.save_companyCulture(content);
            String jsonString = JSONUtils.toJSONString("0");
            req.setCharacterEncoding("UTF-8");
            resp.setCharacterEncoding("UTF-8");
            resp.getWriter().write(jsonString);
            resp.getWriter().flush();
            resp.getWriter().close();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }


    @RequestMapping(value = "/save_companyFiles")
    public void save_companyFiles(HttpServletRequest req, HttpServletResponse resp) {
        try {
            String content = req.getParameter("content");
            metadataService.save_companyFiles(content);
            String jsonString = JSONUtils.toJSONString("0");
            req.setCharacterEncoding("UTF-8");
            resp.setCharacterEncoding("UTF-8");
            resp.getWriter().write(jsonString);
            resp.getWriter().flush();
            resp.getWriter().close();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    @RequestMapping(value = "/save_trainning")
    public void save_trainning(HttpServletRequest req, HttpServletResponse resp) {
        try {
            String content = req.getParameter("content");
            metadataService.save_trainning(content);
            String jsonString = JSONUtils.toJSONString("0");
            req.setCharacterEncoding("UTF-8");
            resp.setCharacterEncoding("UTF-8");
            resp.getWriter().write(jsonString);
            resp.getWriter().flush();
            resp.getWriter().close();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    @RequestMapping(value = "/save_brandBuild")
    public void save_brandBuild(HttpServletRequest req, HttpServletResponse resp) {
        try {
            String content = req.getParameter("content");
            metadataService.save_brandBuild(content);
            String jsonString = JSONUtils.toJSONString("0");
            req.setCharacterEncoding("UTF-8");
            resp.setCharacterEncoding("UTF-8");
            resp.getWriter().write(jsonString);
            resp.getWriter().flush();
            resp.getWriter().close();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }



    @RequestMapping(value = "/save_aboutus")
    public void save_aboutus(HttpServletRequest req, HttpServletResponse resp) {
        try {
            String content = req.getParameter("content");
            metadataService.save_aboutus(content);
            String jsonString = JSONUtils.toJSONString("0");
            req.setCharacterEncoding("UTF-8");
            resp.setCharacterEncoding("UTF-8");
            resp.getWriter().write(jsonString);
            resp.getWriter().flush();
            resp.getWriter().close();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }


    @RequestMapping(value = "/save_sqba")
    public void save_sqna(HttpServletRequest req, HttpServletResponse resp) {
        try {
            String content = req.getParameter("content");
            metadataService.save_sqba(content);
            String jsonString = JSONUtils.toJSONString("0");
            req.setCharacterEncoding("UTF-8");
            resp.setCharacterEncoding("UTF-8");
            resp.getWriter().write(jsonString);
            resp.getWriter().flush();
            resp.getWriter().close();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }


    @RequestMapping(value = "/save_scba")
    public void save_scba(HttpServletRequest req, HttpServletResponse resp) {
        try {
            String content = req.getParameter("content");
            metadataService.save_scba(content);
            String jsonString = JSONUtils.toJSONString("0");
            req.setCharacterEncoding("UTF-8");
            resp.setCharacterEncoding("UTF-8");
            resp.getWriter().write(jsonString);
            resp.getWriter().flush();
            resp.getWriter().close();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }



    @RequestMapping(value = "/delete_new")
    public void delete_new(HttpServletRequest req, HttpServletResponse resp) {
        try {
            String id = req.getParameter("id");
            metadataService.delete_new(id);
            String jsonString = JSONUtils.toJSONString("0");
            req.setCharacterEncoding("UTF-8");
            resp.setCharacterEncoding("UTF-8");
            resp.getWriter().write(jsonString);
            resp.getWriter().flush();
            resp.getWriter().close();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
    @RequestMapping(value = "/save_new")
    public void save_new(HttpServletRequest req, HttpServletResponse resp) {
        try {
            String title = req.getParameter("title");
            String content = req.getParameter("content");
            String time = DateUtil.getNow14();
            String id = UUID.randomUUID().toString();
            metadataService.save_new(title,content,time,id);
            String jsonString = JSONUtils.toJSONString("0");
            req.setCharacterEncoding("UTF-8");
            resp.setCharacterEncoding("UTF-8");
            resp.getWriter().write(jsonString);
            resp.getWriter().flush();
            resp.getWriter().close();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }


}
