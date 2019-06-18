package dao;

public class EqualsCourse {
	//判断课程的类别
	public String equalsKind(String courseKind) {
		String courseKindName = null;
		switch (courseKind) {
		case "A":
			courseKindName = "通识教育课";
			break;
		case "B":
			courseKindName = "学科基础课";
			break;
		case "C":
			courseKindName = "专业课";
			break;
		case "D":
			courseKindName = "主要实践环节";
			break;
		case "E":
			courseKindName = "创新创业实践";
			break;
		}
		return courseKindName;
	}
	
	//判断课程的性质
	public String equalsNature(String courseNature) {
		String courseNatureName = null;
		switch (courseNature) {
		case "A":
			courseNatureName = "无";
			break;
		case "B":
			courseNatureName = "必修课";
			break;
		case "C":
			courseNatureName = "选修课";
			break;
		}
		return courseNatureName;
	}
	
	//判断课程的考核方式
	public String equalsExam(String courseExam) {
		String courseExamName = null;
		switch (courseExam) {
		case "A":
			courseExamName = "考试";
			break;
		case "B":
			courseExamName = "考查";
			break;
		}
		return courseExamName;
	}
	
	//判断课程的承担单位
	public String equalsCollege(String courseCollege) {
		String courseCollegeName = null;
		switch (courseCollege) {
		case "A":
			courseCollegeName = "教育学院";
			break;
		case "B":
			courseCollegeName = "会计学院";
			break;
		case "C":
			courseCollegeName = "外国语学院";
			break;
		case "D":
			courseCollegeName = "社会与法学院";
			break;
		case "E":
			courseCollegeName = "马克思主义学院";
			break;
		case "F":
			courseCollegeName = "数据科学与计算机学院";
			break;
		case "G":
			courseCollegeName = "旅游学院";
			break;
		case "H":
			courseCollegeName = "数学学院";
			break;
		case "I":
			courseCollegeName = "体育学院";
			break;
		case "J":
			courseCollegeName = "学生就业部";
			break;
		}
		return courseCollegeName;
	}
}
