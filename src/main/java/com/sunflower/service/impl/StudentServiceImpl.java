package com.sunflower.service.impl;

import com.alibaba.druid.support.json.JSONUtils;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.sunflower.dao.MetadataDao;
import com.sunflower.dao.StudentDao;
import com.sunflower.service.MetadataService;
import com.sunflower.service.StudentService;
import com.sunflower.util.DateUtil;
import com.sunflower.util.HttpRequestor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

@Service
public class StudentServiceImpl implements StudentService {
    @Autowired
    private StudentDao studentDao;
    //绑定公众号appid
    String appid = "wx8a6e796d316ad625";
    //绑定公众号secret
    String secret = "977cf5af4161b572f71a378777c4dd65";

    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    public Map<String, Object> getStudentBaseInfo(String student_id) {
        return studentDao.getStudentBaseInfo(student_id);
    }

    public List<Map<String, Object>> getStudentClassInfo(String student_id) {
        return studentDao.getStudentClassInfo(student_id);
    }

    public String getAccessTokenOfJssdk() {
        // TODO Auto-generated method stub
        String getTokenUrl = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid="+appid+"&secret="+secret;
        //查询数据库，是否存在access_token
        List<Map<String, Object>> tokenJsonList = studentDao.selectGlobalAccessToken();
        //存在
        if(tokenJsonList.size() > 0) {
            Map<String, Object> jsonStr = tokenJsonList.get(0);
            System.out.println("----------"+jsonStr);
            JSONUtils.parse(JSONUtils.toJSONString(jsonStr));
            JSONObject tokenJson = JSONObject.parseObject(JSON.toJSONString(jsonStr));
            //获取上次写入token时间
            String dateTime = tokenJson.get("time").toString();
            try {
                Date validdate = sdf.parse(dateTime);
                //比较与当前时间差
                Long times = DateUtil.timeDifference(validdate);
                if(times > 5400) {//token小于1.5小时，则重新获取
                    String  newTokenStr = new HttpRequestor().doGet(getTokenUrl);
                    JSONObject newTokenJson = JSONObject.parseObject(newTokenStr);
                    String newToken = newTokenJson.getString("access_token");
                    if(newToken !=null && newToken!="") {
                        //写入数据库
                        studentDao.updateGlobalAccessToken(newToken,DateUtil.getNow());
                        return newToken;
                    }
                }else {
                    return tokenJson.get("token").toString();
                }
            } catch (Exception e) {
                // TODO: handle exception
            }
        }else{
            String  newTokenStr = null;
            try {
                newTokenStr = new HttpRequestor().doGet(getTokenUrl);
            } catch (Exception e) {
                e.printStackTrace();
            }
            JSONObject newTokenJson = JSONObject.parseObject(newTokenStr);
            String newToken = newTokenJson.getString("access_token");
            if(newToken !=null && newToken!="") {
                //写入数据库
                studentDao.updateGlobalAccessToken(newToken,DateUtil.getNow());
                return newToken;
            }
        }
        return null;
    }

    public String getJsapiTicketOfJssdk(String accessToken) {
        // TODO Auto-generated method stub
        String jsapiUrl = "https://api.weixin.qq.com/cgi-bin/ticket/getticket?access_token="+accessToken+"&type=jsapi";
        List<Map<String, Object>> ticketJsonList = studentDao.selectJsapiTicket();
        if(ticketJsonList.size() > 0) {
            Map<String, Object> jsonStr = ticketJsonList.get(0);
            JSONObject ticketJson = JSONObject.parseObject(JSON.toJSONString(jsonStr));
            String dateTime = ticketJson.get("time").toString();
            try {
                Date validdate = sdf.parse(dateTime);
                Long times = DateUtil.timeDifference(validdate);
                if(times > 5400) {//token小于1.5小时，则重新获取
                    System.out.println("----------------------"+jsapiUrl);
                    String  newTicketStr = new HttpRequestor().doGet(jsapiUrl);
                    System.out.println("----------------------"+newTicketStr);
                    JSONObject newTicketJson = JSONObject.parseObject(newTicketStr);
                    String newTicket = newTicketJson.getString("ticket");
                    System.out.println("----------------------"+newTicket);
                    if(newTicket !=null && newTicket!="") {
                        //写入数据库
                        studentDao.updateJsapiTicket(newTicket,DateUtil.getNow());
                        return newTicket;
                    }
                }else {
                    return ticketJson.get("ticket").toString();
                }
            } catch (Exception e) {
                // TODO: handle exception
            }
        }else{
            System.out.println("----------------------"+jsapiUrl);
            String  newTicketStr = null;
            try {
                newTicketStr = new HttpRequestor().doGet(jsapiUrl);
            } catch (Exception e) {
                e.printStackTrace();
            }
            System.out.println("----------------------"+newTicketStr);
            JSONObject newTicketJson = JSONObject.parseObject(newTicketStr);
            String newTicket = newTicketJson.getString("ticket");
            System.out.println("----------------------"+newTicket);
            if(newTicket !=null && newTicket!="") {
                //写入数据库
                studentDao.updateJsapiTicket(newTicket,DateUtil.getNow());
                return newTicket;
            }
        }

        return null;    }

    public Integer getStudentIdByName(String studentName) {
        return studentDao.getStudentIdByName(studentName);
    }

    public List<String> getTecherList() {
        return studentDao.getTecherList();
    }

    public List<String> getTecherClassList(String teacher) {
        return studentDao.getTecherClassList(teacher);
    }

    public List<Map<String, Object>> getTecherClassStudentList(String classId) {
        return studentDao.getTecherClassStudentList(classId);
    }


}
