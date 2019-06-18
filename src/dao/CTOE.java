package dao;

public class CTOE {
		//判断课程的类别
		public String CTOEOfKind(String courseKind) {
			String courseKindName = null;
			if ("通识教育课".equals(courseKind)) {
			courseKindName = "A";
			}else if("学科基础课".equals(courseKind)) {
				courseKindName = "B";
			}else if("专业课".equals(courseKind)) {
				courseKindName = "C";
			}else if("主要实践环节".equals(courseKind)) {
				courseKindName = "D";
			}else if("创新创业实践".equals(courseKind)) {
				courseKindName = "E";
			}else {
				courseKindName = null;
			}
			return courseKindName;
		}
		
		//判断课程的性质
		public String CTOEOfNature(String courseNature) {
			String courseNatureName = null;
			if("无".equals(courseNature)) {
				courseNatureName = "A";
			}else if("必修课".equals(courseNature)) {
				courseNatureName = "B";
			}else if("选修课".equals(courseNature)) {
				courseNatureName = "C";
			}else {
				courseNatureName = null;
			}
			return courseNatureName;
		}
		
		//判断课程的考核方式
		public String CTOEOfExam(String courseExam) {
			String courseExamName = null;
			if("考试".equals(courseExam)) {
				courseExamName = "A";
			}else if("考查".equals(courseExam)) {
				courseExamName = "B";
			}else {
				courseExamName = null;
			}
			return courseExamName;
		}
		
		//判断课程的承担单位
		public String CTOEOfCollege(String courseCollege) {
			String courseCollegeName = null;
			if("教育学院".equals(courseCollege)) {
				courseCollegeName = "A";
			}else if("会计学院".equals(courseCollege)) {
				courseCollegeName = "B";
			}else if("外国语学院".equals(courseCollege)) {
				courseCollegeName = "C";
			}else if("社会与法学院".equals(courseCollege)) {
				courseCollegeName = "D";
			}else if("马克思主义学院".equals(courseCollege)) {
				courseCollegeName = "E";
			}else if("数据科学与计算机学院".equals(courseCollege)) {
				courseCollegeName = "F";
			}else if("旅游学院".equals(courseCollege)) {
				courseCollegeName = "G";
			}else if("数学学院".equals(courseCollege)) {
				courseCollegeName = "H";
			}else if("体育学院".equals(courseCollege)) {
				courseCollegeName = "I";
			}else if("学生就业部".equals(courseCollege)) {
				courseCollegeName = "J";
			}else {
				 courseCollegeName = null;
			}
			return courseCollegeName;
		}
}
