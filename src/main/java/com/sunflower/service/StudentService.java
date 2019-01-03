package com.sunflower.service;

import java.util.List;
import java.util.Map;

public interface StudentService {

    //根据学生id获取 学生姓名，昵称，学生生日，加入时间
    Map<String, Object> getStudentBaseInfo(String student_id);

    //根据学生id获取该学生所上课程信息，与该课程剩余的课程
    List<Map<String, Object>> getStudentClassInfo(String student_id);

    //微信获取accesstoken
    String getAccessTokenOfJssdk();

    //微信获取jsapi ticket
    String getJsapiTicketOfJssdk(String accessToken);

    Integer getStudentIdByName(String studentName);

    List<String> getTecherList();

    List<String> getTecherClassList(String teacher);

    List<Map<String,Object>> getTecherClassStudentList(String classId);




}
