package com.sunflower.dao;

import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Map;

@Repository
public interface StudentDao {

    //根据学生id获取 学生姓名，昵称，学生生日，加入时间
    Map<String, Object> getStudentBaseInfo(String student_id);

    //根据学生id获取该学生所上课程信息，与该课程剩余的课程
    List<Map<String, Object>> getStudentClassInfo(String student_id);

    //获取最新token
    List<Map<String, Object>>  selectGlobalAccessToken();

    //入库最新token
    void updateGlobalAccessToken(String token,String time);


    //获取最新ticket
    List<Map<String,Object>> selectJsapiTicket ();

    //更新ticket
    void updateJsapiTicket(String ticket,String time);

    Integer getStudentIdByName(String studentName);

    List<String> getTecherList();

    List<String> getTecherClassList(String teacher);

    List<Map<String,Object>> getTecherClassStudentList(String classId);




}