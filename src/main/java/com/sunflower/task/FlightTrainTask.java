package com.sunflower.task;

        import com.sunflower.service.impl.StudentServiceImpl;
        import org.springframework.beans.factory.annotation.Autowired;
        import org.springframework.scheduling.annotation.Scheduled;
        import org.springframework.stereotype.Component;

        import java.util.LinkedList;


@Component
public class FlightTrainTask {
    @Autowired
    private StudentServiceImpl studentService;

    @Scheduled(cron = "0/60 * * * * ? ") // 间隔5秒执行
    public void taskCycle() {
//        System.out.println("使用SpringMVC框架配置定时任务");
//        LinkedList<String> teacher_list = (LinkedList)studentService.getTecherList();
//        for(int i = 0; i <teacher_list.size();i++){
//            System.out.println(teacher_list.get(i));
//        }
    }
}