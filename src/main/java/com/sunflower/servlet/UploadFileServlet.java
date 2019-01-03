package com.sunflower.servlet;

import com.alibaba.fastjson.JSONObject;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.*;

public class UploadFileServlet extends HttpServlet {

	/**
	 * 获取存储文件夹的上传路径
	 *
	 * @return
	 * @throws IOException
	 */

	protected void doPost(HttpServletRequest request,
						  HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = null;
		try {
			response.setCharacterEncoding("UTF-8");
			out = response.getWriter();
			// sunwei start
			String saveUrl = "http://47.101.219.55/upload/";
//			String savePath = "C:\\\\nginx-1.9.6\\\\nginx-1.9.6\\\\html\\\\upload";// /ms/userfiles/upload  /usr/local/nginx/html/upload
			String savePath = "/usr/local/nginx/html/upload";
			String s = savePath;
			HashMap<String, String> extMap = new HashMap<String, String>();
			// 文件支持的类型
			extMap.put("image", "gif,jpg,jpeg,png,bmp");
			extMap.put("flash", "swf,flv");
			extMap.put("media", "3gp,mp4");
			extMap.put("file",
					"doc,docx,xls,xlsx,ppt,htm,html,txt,zip,rar,gz,bz2");
			// 上传文件的最大限制
			long maxSize = 100 * 1024;

			// 设置响应格式
			response.setContentType("text/html; charset=UTF-8");
			if (!ServletFileUpload.isMultipartContent(request)) {
				out.println(getError("请选择文件。"));
				return;
			}

			// 检查目录是否存在不存在创建目录
			File uploadDir = new File(savePath);
			if (!uploadDir.isDirectory()) {
				if (!uploadDir.exists()) {
					uploadDir.mkdirs();
				}

			}
			// 检查目录写权限
			if (!uploadDir.canWrite()) {
				out.println(getError("上传目录没有写权限。"));
				return;
			}

			File saveDirFile = new File(savePath);
			if (!saveDirFile.exists()) {
				saveDirFile.mkdirs();
			}

			/**
			 * @description 注释为官方提供的java服务端上传方法，但不兼容Spring
			 *              MVC,upload.parseRequest(request); 无法获取到文件列表，因为在此之前
			 *              文件已经被Spring拦截处理
			 */
			FileItemFactory factory = new DiskFileItemFactory();
			ServletFileUpload upload = new ServletFileUpload(factory);
			upload.setHeaderEncoding("UTF-8");
			List items = null;
			try {
				items = upload.parseRequest(request);
			} catch (FileUploadException e) {
				e.printStackTrace();
			}
			Iterator itr = items.iterator();
			while (itr.hasNext()) {
				FileItem item = (FileItem) itr.next();
				String fileName = item.getName();
				long fileSize = item.getSize();
				if (!item.isFormField()) {
					// 检查扩展名
					String fileExt = fileName.substring(
							fileName.lastIndexOf(".") + 1).toLowerCase();
					SimpleDateFormat df = new SimpleDateFormat("yyyyMMddHHmmss");
					String newFileName = df.format(new Date()) + "_"
							+ new Random().nextInt(1000) + "." + fileExt;
					try {
						File uploadedFile = new File(savePath, newFileName);
						String test = newFileName.substring(
								newFileName.indexOf(".") + 1,
								newFileName.length());
						String[] types = extMap.get("media").split(",");
						if (types[0].equals(test) || types[1].equals(test)) {
						} else {
							item.write(uploadedFile);
						}
					} catch (Exception e) {
						e.printStackTrace();
						out.println(getError("上传文件失败。"));
						return;
					}
					JSONObject obj = new JSONObject();
					obj.put("error", 0);
					obj.put("url", saveUrl + newFileName);
					out.println(obj.toJSONString());
				}
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			out.close();
		}
	}

	protected void doGet(HttpServletRequest request,
						 HttpServletResponse response) throws ServletException, IOException {

		this.doPost(request, response);

	}

	private String getError(String message) {
		JSONObject obj = new JSONObject();
		obj.put("error", 1);
		obj.put("message", message);
		return obj.toJSONString();
	}
}
